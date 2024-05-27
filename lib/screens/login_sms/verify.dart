import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../app.dart';
import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../common/tools/flash.dart';
import '../../custom/providers/registration_provider.dart';
import '../../data/boxes.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart';
import '../../services/services.dart';
import '../../widgets/common/flux_image.dart';
import '../../widgets/common/login_animation.dart';
import '../../widgets/common/place_picker.dart';

class VerifyCode extends StatefulWidget {
  final String? phoneNumber;
  final String? verId;
  final Stream<String?>? verifySuccessStream;
  final int? resendToken;
  final Function(String, User)? callback;

  const VerifyCode(
      {this.verId,
      this.phoneNumber,
      this.verifySuccessStream,
      this.resendToken,
      this.callback});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode>
    with TickerProviderStateMixin, CodeAutoFill {
  late AnimationController _loginButtonController;
  bool isLoading = false;
  List<Address?> listAddress = [];
  Address? address;
  Address? remoteAddress;

  final TextEditingController _pinCodeController = TextEditingController();

  bool hasError = false;
  String currentText = '';
  var onTapRecognizer;
  int? _resendToken;
  String? _verId;

  @override
  void codeUpdated() {
    if (mounted && code != null && code!.isNotEmpty) {
      _loginSMS(code, context);
      setState(() {});
      Tools.hideKeyboard(context);
    }
  }

  Future<void> _verifySuccessStreamListener(String? otp) async {
    _pinCodeController.text = otp ?? '';
    Tools.hideKeyboard(context);
  }

  @override
  void initState() {
    super.initState();
    _resendToken = widget.resendToken;
    _verId = widget.verId;
    widget.verifySuccessStream?.listen(_verifySuccessStreamListener);

    listenForCode();

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _playAnimation();
        Future autoRetrieve(String verId) {
          return _stopAnimation();
        }

        Future smsCodeSent(String verId, [int? forceCodeResend]) {
          _resendToken = forceCodeResend;
          _verId = verId;
          return _stopAnimation();
        }

        void verifyFailed(exception) {
          _stopAnimation();
          _failMessage(exception.toString(), context);
        }

        Services().firebase.verifyPhoneNumber(
              phoneNumber: widget.phoneNumber,
              codeAutoRetrievalTimeout: autoRetrieve,
              codeSent: smsCodeSent,
              verificationCompleted: (credential) {},
              forceResendingToken: _resendToken,
              verificationFailed: verifyFailed,
            );
      };

    _loginButtonController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    widget.verifySuccessStream?.listen(null);
    _loginButtonController.dispose();
    _pinCodeController.dispose();
    cancel();
    super.dispose();
  }

  Future _playAnimation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _loginButtonController.forward();
    } on TickerCanceled {
      printLog('[_playAnimation] error');
    }
  }

  Future _stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      setState(() {
        isLoading = false;
      });
    } on TickerCanceled {
      printLog('[_stopAnimation] error');
    }
  }

  void _failMessage(message, context) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
    // var _message = message;
    // if (kReleaseMode) {
    //   _message = S.of(context).userNameInCorrect;
    // }

    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: S.of(context).close,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _loginSMS(smsCode, context) async {
    await _playAnimation();
    try {
      final credential = Services().firebase.getFirebaseCredential(
            verificationId: _verId!,
            smsCode: smsCode,
          );
      await _signInWithCredential(credential);
    } catch (e) {
      await _stopAnimation();
      _failMessage(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: true);
    final themeConfig = appModel.themeConfig;
    final textStyle = Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
          color: Theme.of(context).primaryColor,
        );
    final fontSize = textStyle?.fontSize;
    final fieldHeight = fontSize != null ? fontSize * 1.4 : null;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).verifySMSCode,
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 40.0,
                        child: FluxImage(imageUrl: themeConfig.logo)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                S.of(context).phoneNumberVerification,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: RichText(
                  text: TextSpan(
                    text: S.of(context).enterSendedCode,
                    children: [
                      TextSpan(
                        text: Tools.isRTL(context)
                            ? ' ${widget.phoneNumber?.replaceAll('+', '')}+'
                            : ' +${widget.phoneNumber?.replaceAll('+', '')}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 15,
                            ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(0.54),
                          fontSize: 15,
                        ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  controller: _pinCodeController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderWidth: 2,
                    activeFillColor: Theme.of(context).colorScheme.background,
                    disabledColor: Theme.of(context).disabledColor,
                    fieldHeight: fieldHeight,
                  ),
                  length: 6,
                  cursorHeight: 30,
                  autoFocus: true,
                  obscuringCharacter: '*',
                  textStyle: textStyle,
                  animationType: AnimationType.scale,
                  hapticFeedbackTypes: HapticFeedbackTypes.light,
                  useHapticFeedback: true,
                  autoDisposeControllers: false,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {
                    if (value.length == 6) _loginSMS(value, context);
                  },
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              // error showing widget
              child: Text(
                hasError ? S.of(context).pleasefillUpAllCellsProperly : '',
                style: TextStyle(color: Colors.red.shade300, fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: S.of(context).didntReceiveCode,
                  style: const TextStyle(fontSize: 15),
                  children: [
                    TextSpan(
                        text: S.of(context).resend,
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))
                  ]),
            ),
            const SizedBox(height: 14),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 30,
              ),
              child: StaggerAnimation(
                titleButton: S.of(context).verifySMSCode,
                buttonController:
                    _loginButtonController.view as AnimationController,
                onTap: () {
                  if (_pinCodeController.text.trim().length == 6) {
                    _loginSMS(_pinCodeController.text, context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


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
  }

  Future<void> _signInWithCredential(credential) async {
    final user = await Services()
        .firebase
        .loginFirebaseCredential(credential: credential);
    if (user != null) {
      if (widget.callback != null) {
        await _stopAnimation();
        widget.callback!(_pinCodeController.text, user);
        Navigator.pop(context);
      } else {
        await Provider.of<UserModel>(context, listen: false).loginFirebaseSMS(
          phoneNumber: user.phoneNumber!.replaceAll('+', ''),
          success: (user) async {
            await _stopAnimation();

            getDataFromLocal();
            if(listAddress.isEmpty ){
              var user = Provider.of<UserModel>(context, listen: false).user;
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlacePicker(
                    kIsWeb
                        ? kGoogleApiKey.web
                        : isIos
                        ? kGoogleApiKey.ios
                        : kGoogleApiKey.android,
                    fromRegister: true,
                  ),
                ),
              );

              if (result is LocationResult) {
                try{
                  address = Address();
                  address?.country = result.country;
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
                  address?.phoneNumber = user?.phoneNumber;

                  if (address != null) {
                    Provider.of<CartModel>(App.fluxStoreNavigatorKey.currentState!.context, listen: false).setAddress(address);
                    await saveDataToLocal();
                    return;
                  } else {
                    await FlashHelper.errorMessage(
                      context,
                      message: S.of(context).pleaseInput,
                    );
                  }
                }catch(e){
                  log('fuckk :: $e');
                  await FlashHelper.errorMessage(
                    context,
                    message:e.toString(),
                  );
                }
              }
            }
            else {
              final canPop = ModalRoute.of(context)!.canPop;
              if (canPop) {
                // When not required login
                Navigator.of(context).pop();
              } else {
                // When required login
                await Navigator.of(App.fluxStoreNavigatorKey.currentContext!)
                    .pushReplacementNamed(RouteList.dashboard);
              }
            }


          },
          fail: (message) {
            _stopAnimation();
            _failMessage(message, context);
          },
        );
      }
    } else {
      await _stopAnimation();
      _failMessage(S.of(context).invalidSMSCode, context);
    }
  }
}



class CustomVerifyCode extends StatefulWidget {
  final String? phoneNumber;
  final String? verId;
  final Stream<String?>? verifySuccessStream;
  final int? resendToken;
  final Function(String, User?)? callback;
  final Future<void> Function(String test)? onVerfiySuccesTORENAME;

  const CustomVerifyCode({
    this.verId,
    this.phoneNumber,
    this.verifySuccessStream,
    this.resendToken,
    this.callback, this.onVerfiySuccesTORENAME,
  });

  @override
  State<CustomVerifyCode> createState() => _CustomVerifyCodeState();
}

class _CustomVerifyCodeState extends State<CustomVerifyCode>
    with TickerProviderStateMixin, CodeAutoFill {
  late AnimationController _loginButtonController;
  bool isLoading = false;

  final TextEditingController _pinCodeController = TextEditingController();

  bool hasError = false;
  String currentText = '';
  var onTapRecognizer;
  int? _resendToken;
  String? _verId;

  @override
  void codeUpdated() {
    if (mounted && code != null && code!.isNotEmpty) {
      _loginSMS(code, context);
      setState(() {});
      Tools.hideKeyboard(context);
    }
  }

  Future<void> _verifySuccessStreamListener(String? otp) async {
    _pinCodeController.text = otp ?? '';
    Tools.hideKeyboard(context);
  }

  @override
  void initState() {
    super.initState();
    _resendToken = widget.resendToken;
    _verId = widget.verId;
    widget.verifySuccessStream?.listen(_verifySuccessStreamListener);

    listenForCode();

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        _playAnimation();
        Future autoRetrieve(String verId) {
          return _stopAnimation();
        }

        Future smsCodeSent(String verId, [int? forceCodeResend]) {
          _resendToken = forceCodeResend;
          _verId = verId;
          return _stopAnimation();
        }

        void verifyFailed(exception) {
          _stopAnimation();
          _failMessage(exception.toString(), context);
        }

        Services().firebase.verifyPhoneNumber(
          phoneNumber: widget.phoneNumber,
          codeAutoRetrievalTimeout: autoRetrieve,
          codeSent: smsCodeSent,
          verificationCompleted: (credential) {},
          forceResendingToken: _resendToken,
          verificationFailed: verifyFailed,
        );
      };

    _loginButtonController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    widget.verifySuccessStream?.listen(null);
    _loginButtonController.dispose();
    _pinCodeController.dispose();
    cancel();
    super.dispose();
  }

  Future _playAnimation() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _loginButtonController.forward();
    } on TickerCanceled {
      printLog('[_playAnimation] error');
    }
  }

  Future _stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      setState(() {
        isLoading = false;
      });
    } on TickerCanceled {
      printLog('[_stopAnimation] error');
    }
  }

  void _failMessage(message, context) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: S.of(context).close,
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _loginSMS(smsCode, context) async {
    await _playAnimation();
    try {
      final credential = Services().firebase.getFirebaseCredential(
        verificationId: _verId!,
        smsCode: smsCode,
      );
      await _verifyOTP(credential);
    } catch (e) {
      await _stopAnimation();
      _failMessage(e.toString(), context);
    }
  }

  Future<void> _verifyOTP(credential) async {
    try {
      final userCredential = await Services().firebase.loginFirebaseCredential(credential: credential);
      if (userCredential != null) {

        if(widget.onVerfiySuccesTORENAME != null) {
          await widget.onVerfiySuccesTORENAME!('DSLDSKDSKDSd  ${credential.toString()}');
        }
        await _stopAnimation();
      } else {
        await _stopAnimation();

        throw Exception(S.of(context).invalidSMSCode);
      }
    } catch (e) {
      await _stopAnimation();
      _failMessage(S.of(context).invalidSMSCode, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: true);
    final themeConfig = appModel.themeConfig;
    final textStyle = Theme.of(context).primaryTextTheme.displaySmall?.copyWith(
      color: Theme.of(context).primaryColor,
    );
    final fontSize = textStyle?.fontSize;
    final fieldHeight = fontSize != null ? fontSize * 1.4 : null;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).verifySMSCode,
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Provider.of<RegistrationProvider>(context,listen: false).stopLoading();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 40.0,
                        child: FluxImage(imageUrl: themeConfig.logo)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                S.of(context).phoneNumberVerification,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: RichText(
                  text: TextSpan(
                    text: S.of(context).enterSendedCode,
                    children: [
                      TextSpan(
                        text: Tools.isRTL(context)
                            ? ' ${widget.phoneNumber?.replaceAll('+', '')}+'
                            : ' +${widget.phoneNumber?.replaceAll('+', '')}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(0.54),
                      fontSize: 15,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  controller: _pinCodeController,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderWidth: 2,
                    activeFillColor: Theme.of(context).colorScheme.background,
                    disabledColor: Theme.of(context).disabledColor,
                    fieldHeight: fieldHeight,
                  ),
                  length: 6,
                  cursorHeight: 30,
                  autoFocus: true,
                  obscuringCharacter: '*',
                  textStyle: textStyle,
                  animationType: AnimationType.scale,
                  hapticFeedbackTypes: HapticFeedbackTypes.light,
                  useHapticFeedback: true,
                  autoDisposeControllers: false,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {
                    if (value.length == 6) _loginSMS(value, context);
                  },
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? S.of(context).pleasefillUpAllCellsProperly : '',
                style: TextStyle(color: Colors.red.shade300, fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: S.of(context).didntReceiveCode,
                  style: const TextStyle(fontSize: 15),
                  children: [
                    TextSpan(
                        text: S.of(context).resend,
                        recognizer: onTapRecognizer,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))
                  ]),
            ),
            const SizedBox(height: 14),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 30,
              ),
              child: StaggerAnimation(
                titleButton: S.of(context).verifySMSCode,
                buttonController:
                _loginButtonController.view as AnimationController,
                onTap: () {
                  if (_pinCodeController.text.trim().length == 6) {
                    _loginSMS(_pinCodeController.text, context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
