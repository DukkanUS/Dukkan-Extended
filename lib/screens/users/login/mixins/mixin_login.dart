import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app.dart';
import '../../../../common/config.dart';
import '../../../../common/constants.dart';
import '../../../../common/events.dart';
import '../../../../common/tools/flash.dart';
import '../../../../custom/Phone Verification/phone_verification.dart';
import '../../../../data/boxes.dart';
import '../../../../generated/l10n.dart';
import '../../../../models/index.dart';
import '../../../../modules/sms_login/sms_login.dart';
import '../../../../routes/flux_navigate.dart';
import '../../../../services/index.dart';
import '../../../../widgets/common/place_picker.dart';
import '../../../../widgets/common/webview.dart';
import '../../../base_screen.dart';
import '../../../login_sms/login_sms_screen.dart';
import '../../../login_sms/login_sms_viewmodel.dart';
import '../../forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

typedef LoginSocialFunction = Future<void> Function({
  required Function(User user) success,
  required Function(String) fail,
  BuildContext context,
});

typedef LoginFunction = Future<void> Function({
  required String username,
  required String password,
  required Function(User user) success,
  required Function(String) fail,
});

mixin LoginMixin<T extends StatefulWidget> on BaseScreen<T> {
  bool _isActiveAudio = false;
  List<Address?> listAddress = [];
  Address? address;
  Address? remoteAddress;

  Future<void> beforeCallLogin();
  Future<void> afterCallLogin(bool isLoginSuccess);

  TextEditingController get usernameCtrl;
  TextEditingController get passwordCtrl;
  VoidCallback? get loginSms => null;
  bool get isActiveAudio => _isActiveAudio;

  UserModel get _userModel => Provider.of<UserModel>(context, listen: false);
  LoginFunction get _login => _userModel.login;
  LoginSocialFunction get _loginFB => _userModel.loginFB;
  LoginSocialFunction get _loginApple => _userModel.loginApple;
  LoginSocialFunction get _loginGoogle => _userModel.loginGoogle;
  AudioManager get _audioPlayerService => injector<AudioManager>();

  void getDataFromLocal() {
    var listData = List<Address>.from(UserBox().addresses);
    final indexRemote =
    listData.indexWhere((element) => element.isShow == false);
    if (indexRemote != -1) {
      remoteAddress = listData[indexRemote];
    }

    listData.removeWhere((element) => element.isShow == false);
    listAddress = listData;
    setState(() {});
  }

  Future<void> saveDataToLocal() async {
    var listAddress = <Address>[];
    final address = this.address;
    if (address != null) {
      listAddress.add(address);
    }
    var listData = UserBox().addresses;
    if (listData.isNotEmpty) {
      for (var item in listData) {
        listAddress.add(item);
      }
    }
    UserBox().addresses = listAddress;
    await Navigator.of(App.fluxStoreNavigatorKey.currentState!.context).pushReplacementNamed(RouteList.dashboard);
  }  Future<void> saveDataToLocal2() async {
    var listAddress = <Address>[];
    final address = this.address;
    if (address != null) {
      listAddress.add(address);
    }
    var listData = UserBox().addresses;
    if (listData.isNotEmpty) {
      for (var item in listData) {
        listAddress.add(item);
      }
    }
    UserBox().addresses = listAddress;
  }

  Future<void> redirectingAfterLoginSuccess({bool? googleLogin ,bool? appleLogin, bool? facebookLogin, String? phonenumbereee }) async {

   await  context.read<UserModel>().saveVerifyStatus(status: true);
   if(_userModel.user?.shipping?.address1?.isNotEmpty ?? false){

     try{
       address = Address();
       address?.street =_userModel.user?.shipping?.address1;
       address?.apartment = _userModel.user?.shipping?.address2;
       address?.city = _userModel.user?.shipping?.city;
       address?.zipCode = _userModel.user?.shipping?.postCode;
       address?.state =_userModel.user?.shipping?.state;
       Provider.of<CartModel>(App.fluxStoreNavigatorKey.currentState!.context, listen: false).setAddress(address);
       await saveDataToLocal2();
     }catch(e,trace){
       printLog(e.toString());
       printLog(trace.toString());
     }

   }

    getDataFromLocal();
    if(listAddress.isEmpty ){
      var user = Provider.of<UserModel>(context, listen: false).user;
       await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            kIsWeb
                ? kGoogleApiKey.web
                : isIos
                ? kGoogleApiKey.ios
                : kGoogleApiKey.android,
            onPop: (validContext, result) async{
              if (result is LocationResult) {
                try{
                  address = Address();
                  address?.country = result.country;
                  address?.apartment = result.apartment;
                  address?.street = result.street;
                  address?.state = result.state;
                  address?.city = result.city;
                  address?.zipCode = result.zip;
                  if (result.latLng?.latitude != null &&
                      result.latLng?.latitude != null) {
                    address?.mapUrl =
                    'https://maps.google.com/maps?q=${result.latLng?.latitude},${result.latLng?.longitude}&output=embed';
                    address?.latitude = result.latLng?.latitude.toString();
                    address?.longitude = result.latLng?.longitude.toString();
                  }
                  address?.firstName = user?.firstName;
                  address?.lastName = user?.lastName;
                  address?.email = user?.email;
                  address?.phoneNumber = ((googleLogin ?? false) || (appleLogin ?? false) || (facebookLogin ?? false)) ?  phonenumbereee : user?.phoneNumber;

                  if (address != null) {
                    Provider.of<CartModel>(validContext, listen: false).setAddress(address);
                    await saveDataToLocal();
                    return;
                  } else {
                    await FlashHelper.errorMessage(
                      validContext,
                      message: S.of(validContext).pleaseInput,
                    );
                  }
                }catch(e){
                  log('fuckk :: $e');
                  await FlashHelper.errorMessage(
                    validContext,
                    message:e.toString(),
                  );
                }
              }

            },
            // fromRegister: true,
          ),
        ),
         (route) => false,
      );

    }
    else {
      /// set address is not setting
      await Navigator.of(App.fluxStoreNavigatorKey.currentContext!)
          .pushReplacementNamed(RouteList.dashboard);
    }
  }

  Future<void> loginDone({bool? googleLogin ,bool? appleLogin, bool? facebookLogin }) async {
    if((googleLogin ?? false) || (appleLogin ?? false) || (facebookLogin ?? false)) {
      if(UserBox().isPhoneVerified){
        _updateEventBus();
        await redirectingAfterLoginSuccess(googleLogin: googleLogin,appleLogin: appleLogin,facebookLogin: facebookLogin);
      }else {
        await Navigator.of(context).pushNamed(RouteList.verifyPhoneNumber,
        arguments: PhoneVerificationArguments((phone) =>
            redirectingAfterLoginSuccess(googleLogin: googleLogin,appleLogin: appleLogin,facebookLogin: facebookLogin,phonenumbereee: phone),
          _updateEventBus,() async {
            try{
            printLog('udhuighsudhhghsfduhgu');
            await Services().api.updateUserInfo({'phone':'${Provider.of<CartModel>(App.fluxStoreNavigatorKey.currentState!.context,listen: false).address?.phoneNumber}'}, App.fluxStoreNavigatorKey.currentState!.context.read<UserModel>().user?.cookie);

            }catch(e,trace){
          printLog(e.toString());
          printLog(trace.toString());
          }
          },));

      }
    }else{
      _updateEventBus();
      await redirectingAfterLoginSuccess(googleLogin: googleLogin,appleLogin: appleLogin,facebookLogin: facebookLogin);
    }

  }

  void loginWithFacebook(context) async {
    //showLoading();
    await beforeCallLogin();
    await _loginFB(
      success: (user) {
        //hideLoading();
        afterCallLogin(true);
        loginDone(facebookLogin: true);
      },
      fail: (message) {
        //hideLoading();
        afterCallLogin(false);
        _failMessage(message);
      },
      context: context,
    );
  }

  void loginWithApple(context) async {
    await beforeCallLogin();
    await _loginApple(
        success: (user) {
          afterCallLogin(true);
          loginDone(appleLogin: true);
        },
        fail: (message) {
          afterCallLogin(false);
          _failMessage(message);
        },
        context: context);
  }

  Future<void> runLogin(context) async {
    if (usernameCtrl.text.isEmpty || passwordCtrl.text.isEmpty) {
      unawaited(
        FlashHelper.errorMessage(context,
            message: S.of(context).pleaseInputFillAllFields),
      );
    } else {
      await beforeCallLogin();
      await _login(
        username: usernameCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        success: (user) {
          afterCallLogin(true);
          loginDone();
        },
        fail: (message) {
          afterCallLogin(false);
          _failMessage(message);
        },
      );
    }
  }

  void launchForgetPasswordURL(String? url) async {
    if (url != null && url != '') {
      /// show as webview
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              WebView(url: url, title: S.of(context).resetPassword),
          fullscreenDialog: true,
        ),
      );
    } else {
      /// show as native
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
      );
    }
  }

  void loginWithSMS(context) {
    if (loginSms != null) {
      loginSms!();
      return;
    }

    final supportedPlatforms = [
      'wcfm',
      'dokan',
      'delivery',
      'vendorAdmin',
      'woo',
      'wordpress'
    ].contains(ServerConfig().typeName);

    if (kAdvanceConfig.enableDigitsMobileLogin) {
      Navigator.of(context).pushNamed(RouteList.digitsMobileLogin);
    } else if (supportedPlatforms && (kAdvanceConfig.enableNewSMSLogin)) {
      final model = Provider.of<UserModel>(context, listen: false);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => SMSLoginScreen(
            onSuccess: (user) async {
              await model.setUser(user);
              Navigator.of(context).pop();
              loginDone();
            },
          ),
        ),
      );
    } else {
      Navigator.of(context).pushNamed(RouteList.loginSMS);
    }
  }

  void loginWithGoogle(context) async {
    await beforeCallLogin();
    await _loginGoogle(
        success: (user) {
          //hideLoading();
          afterCallLogin(true);
          loginDone(googleLogin: true);
        },
        fail: (message) {
          //hideLoading();
          afterCallLogin(false);
          _failMessage(message);
        },
        context: context);
  }

  void hideLoading() => Navigator.of(context).pop();

  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: Container(
          padding: const EdgeInsets.all(50.0),
          child: kLoadingWidget(context),
        ));
      },
    );
  }

  void _updateEventBus() {
    eventBus.fire(const EventLoggedIn());
  }

  void _failMessage(String message) {
    if (message.isEmpty) return;

    var messageText = message;
    // if (kReleaseMode) {
    //   messageText = S.of(context).userNameInCorrect;
    // }

    FlashHelper.errorMessage(
      context,
      message: S.of(context).warning(messageText),
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    if (_audioPlayerService.isStickyAudioWidgetActive) {
      _isActiveAudio = true;
      _audioPlayerService
        ..pause()
        ..hideStickyAudioWidget();
    }
  }

  @override
  void dispose() async {
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
