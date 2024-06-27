import 'dart:async';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../app.dart';
import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../common/tools/flash.dart';
import '../../../custom/providers/registration_provider.dart';
import '../../../data/boxes.dart';
import '../../../generated/l10n.dart';
import '../../../models/index.dart'
    show
        Address,
        AppModel,
        CartModel,
        Country,
        CountryState,
        PointModel,
        User,
        UserModel;
import '../../../modules/dynamic_layout/helper/helper.dart';
import '../../../modules/vendor_on_boarding/screen_index.dart';
import '../../../routes/flux_navigate.dart';
import '../../../services/service_config.dart';
import '../../../services/services.dart';
import '../../../widgets/common/custom_text_field.dart';
import '../../../widgets/common/flux_image.dart';
import '../../../widgets/common/place_picker.dart';
import '../../checkout/choose_address_screen.dart';
import '../../home/privacy_term_screen.dart';
import '../../login_sms/verify.dart';
import 'registration_screen_web.dart';

enum RegisterType { customer, vendor }

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Layout.isDisplayDesktop(context)) {
      return const RegistrationScreenWeb();
    }
    return const RegistrationScreenMobile();
  }
}

class RegistrationScreenMobile extends StatefulWidget {
  const RegistrationScreenMobile();

  @override
  State<RegistrationScreenMobile> createState() =>
      _RegistrationScreenMobileState();
}

class _RegistrationScreenMobileState extends State<RegistrationScreenMobile> {
  List<Address?> listAddress = [];
  List<CountryState>? states = [];
  Address? remoteAddress;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final TextEditingController _emailController = TextEditingController();

  String? firstName, lastName, emailAddress, phoneNumber, password;
  RegisterType? _registerType = RegisterType.customer;
  bool isChecked = true;

  final bool showPhoneNumberWhenRegister =
      kLoginSetting.showPhoneNumberWhenRegister;
  final bool requirePhoneNumberWhenRegister =
      kLoginSetting.requirePhoneNumberWhenRegister;

  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final phoneNumberNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  var countryDIalCOde;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) => getDataFromLocal());
    super.initState();
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

  Future<void> saveDataToLocal(Address? address) async {
    var listAddress = <Address>[];
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
    await Navigator.of(App.fluxStoreNavigatorKey.currentState!.context)
        .pushReplacementNamed(RouteList.dashboard);
  }

  Future<void> _welcomeDiaLog(User user) async {
    Provider.of<RegistrationProvider>(context, listen: false).stopLoading();
    Provider.of<CartModel>(context, listen: false).setUser(user);
    await Provider.of<PointModel>(context, listen: false)
        .getMyPoint(user.cookie);
    var email = user.email;
    _showMessage(
      '${S.of(context).welcome} $email!',
      isError: false,
    );
    if (listAddress.isEmpty) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            kIsWeb
                ? kGoogleApiKey.web
                : isIos
                    ? kGoogleApiKey.ios
                    : kGoogleApiKey.android,
            onPop: (validContext, result) async {
              if (result is LocationResult) {
                var address = Address();
                address.country = result.country;
                address.apartment = result.apartment;
                address.street = result.street;
                address.state = result.state;
                address.city = result.city;
                address.zipCode = result.zip;
                if (result.latLng?.latitude != null &&
                    result.latLng?.latitude != null) {
                  address.mapUrl =
                      'https://maps.google.com/maps?q=${result.latLng?.latitude},${result.latLng?.longitude}&output=embed';
                  address.latitude = result.latLng?.latitude.toString();
                  address.longitude = result.latLng?.longitude.toString();
                }
                address.firstName = firstName;
                address.lastName = lastName;
                address.email = _emailController.text;
                address.phoneNumber = '$countryDIalCOde$phoneNumber';

                Provider.of<CartModel>(validContext, listen: false)
                    .setAddress(address);
                final c = Country(id: result.country, name: result.country);
                states = await Services().widget.loadStates(c);
                await saveDataToLocal(address);
              }
            },

            // fromRegister: true,
          ),
        ),
        (route) => false,
      );
    }else{
      await Navigator.of(App.fluxStoreNavigatorKey.currentState!.context)
          .pushReplacementNamed(RouteList.dashboard);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    firstNameNode.dispose();
    lastNameNode.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    phoneNumberNode.dispose();
    super.dispose();
  }

  void _showMessage(
    String text, {
    bool isError = true,
  }) {
    if (!mounted) {
      return;
    }
    Provider.of<RegistrationProvider>(context, listen: false).stopLoading();
    Navigator.of(context).pop();
    FlashHelper.message(
      context,
      message: text,
      isError: isError,
    );
  }

  Future<void> _submitRegister({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? emailAddress,
    String? password,
    bool? isVendor,
  }) async {
    {
      await Provider.of<UserModel>(context, listen: false).createUser(
        username: emailAddress,
        password: password,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        success: _welcomeDiaLog,
        fail: _showMessage,
        isVendor: isVendor,
      );
    }
  }

  void failMessage(message, context) {
    final snackBar = SnackBar(
      content: Text('⚠️: $message'),
      duration: const Duration(seconds: 30),
      action: SnackBarAction(
        label: S.of(context).close,
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Future autoRetrieve(String verId) {
    return Future(() => null);
  }

  Future smsCodeSent(String verId, [int? forceCodeResend]) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomVerifyCode(
          verId: verId,
          phoneNumber: '$countryDIalCOde$phoneNumber',
          resendToken: forceCodeResend,
          onVerfiySuccesTORENAME: (_) async {
            await context.read<UserModel>().saveVerifyStatus(status: true);
            await _submitRegister(
              firstName: firstName,
              lastName: lastName,
              phoneNumber: '$countryDIalCOde$phoneNumber',
              emailAddress: emailAddress,
              password: password,
              isVendor: _registerType == RegisterType.vendor,
            );
          },
        ),
      ),
    );
  }

  void verifyFailed(exception) {
    Provider.of<RegistrationProvider>(context, listen: false).stopLoading();
    _showMessage(exception.toString());
  }

  void loginSMS(context) {
    if (firstName == null ||
        lastName == null ||
        emailAddress == null ||
        password == null ||
        (showPhoneNumberWhenRegister &&
            requirePhoneNumberWhenRegister &&
            phoneNumber == null)) {
      _showMessage(S.of(context).pleaseInputFillAllFields);
    } else if (isChecked == false) {
      _showMessage(S.of(context).pleaseAgreeTerms);
    } else {
      if (!emailAddress.validateEmail()) {
        _showMessage(S.of(context).errorEmailFormat);
        return;
      }

      if (password?.isNotEmpty ?? false) {
        if (password!.length < 8) {
          _showMessage(S.of(context).errorPasswordFormat);
          return;
        }
      }

      try {
        unawaited(Services().firebase.verifyPhoneNumber(
              phoneNumber: '$countryDIalCOde$phoneNumber',
              codeAutoRetrievalTimeout: autoRetrieve,
              verificationCompleted: (value) => log(
                  '🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴'),
              verificationFailed: verifyFailed,
              codeSent: smsCodeSent,
            ));
        // Future.delayed(const Duration(seconds: 1)).then((_) => Provider.of<RegistrationProvider>(context, listen: false).stopLoading());
      } catch (e) {
        Provider.of<RegistrationProvider>(context, listen: false).stopLoading();
        rethrow;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: true);
    final themeConfig = appModel.themeConfig;

    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => Tools.hideKeyboard(context),
            child: ListenableProvider.value(
              value: Provider.of<UserModel>(context),
              child: Consumer<UserModel>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: AutofillGroup(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const SizedBox(height: 10.0),
                            Center(
                              child: FractionallySizedBox(
                                widthFactor: 0.8,
                                child: FluxImage(
                                  useExtendedImage: false,
                                  imageUrl: themeConfig.logo,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            CustomTextField(
                              key: const Key('registerFirstNameField'),
                              autofillHints: const [AutofillHints.givenName],
                              onChanged: (value) => firstName = value,
                              textCapitalization: TextCapitalization.words,
                              nextNode: lastNameNode,
                              showCancelIcon: true,
                              decoration: InputDecoration(
                                labelText: S.of(context).firstName,
                                hintText: S.of(context).enterYourFirstName,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            CustomTextField(
                              key: const Key('registerLastNameField'),
                              autofillHints: const [AutofillHints.familyName],
                              focusNode: lastNameNode,
                              nextNode: showPhoneNumberWhenRegister
                                  ? phoneNumberNode
                                  : emailNode,
                              showCancelIcon: true,
                              textCapitalization: TextCapitalization.words,
                              onChanged: (value) => lastName = value,
                              decoration: InputDecoration(
                                labelText: S.of(context).lastName,
                                hintText: S.of(context).enterYourLastName,
                              ),
                            ),
                            if (showPhoneNumberWhenRegister)
                              const SizedBox(height: 20.0),
                            if (showPhoneNumberWhenRegister)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CountryCodePicker(
                                    hideSearch: true,
                                    showFlag: false,
                                    countryFilter: const ['US', 'JO'],
                                    initialSelection: 'JO',
                                    onInit: (code) {
                                      countryDIalCOde = code?.dialCode!;
                                    },
                                    onChanged: (code) {
                                      countryDIalCOde =
                                          code.dialCode?.toString() ?? '';
                                    },
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    dialogBackgroundColor: Theme.of(context)
                                        .dialogBackgroundColor,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: CustomTextField(
                                      key: const Key('registerPhoneField'),
                                      focusNode: phoneNumberNode,
                                      autofillHints: const [
                                        AutofillHints.telephoneNumber
                                      ],
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) => phoneNumber = value,
                                      decoration: InputDecoration(
                                        labelText: S.of(context).phone,
                                        hintText:
                                            S.of(context).enterYourPhoneNumber,
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  )
                                ],
                              ),
                            const SizedBox(height: 20.0),
                            CustomTextField(
                              key: const Key('registerEmailField'),
                              focusNode: emailNode,
                              autofillHints: const [AutofillHints.email],
                              nextNode: passwordNode,
                              controller: _emailController,
                              onChanged: (value) => emailAddress = value,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: S.of(context).enterYourEmail),
                              hintText: S.of(context).enterYourEmail,
                            ),
                            const SizedBox(height: 20.0),
                            CustomTextField(
                              key: const Key('registerPasswordField'),
                              focusNode: passwordNode,
                              autofillHints: const [AutofillHints.password],
                              showEyeIcon: true,
                              obscureText: true,
                              onChanged: (value) => password = value,
                              decoration: InputDecoration(
                                labelText: S.of(context).enterYourPassword,
                                hintText: S.of(context).enterYourPassword,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            if (kVendorConfig.vendorRegister &&
                                (appModel.isMultivendor ||
                                    ServerConfig().isListeoType))
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${S.of(context).registerAs}:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Row(
                                      children: [
                                        Radio<RegisterType>(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: RegisterType.customer,
                                          groupValue: _registerType,
                                          onChanged: (RegisterType? value) {
                                            setState(() {
                                              _registerType = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          S.of(context).customer,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<RegisterType>(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          value: RegisterType.vendor,
                                          groupValue: _registerType,
                                          onChanged: (RegisterType? value) {
                                            setState(() {
                                              _registerType = value;
                                            });
                                          },
                                        ),
                                        Text(
                                          S.of(context).vendor,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                text: S.current.bySignup,
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: S.of(context).agreeWithPrivacy,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => FluxNavigate.push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PrivacyTermScreen(
                                                showAgreeButton: false,
                                              ),
                                            ),
                                            forceRootNavigator: true,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Material(
                                color: Theme.of(context).primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                elevation: 0,
                                child: MaterialButton(
                                  key: const Key('registerSubmitButton'),
                                  onPressed: value.loading == true
                                      ? null
                                      : () async {
                                          try {
                                            Provider.of<RegistrationProvider>(
                                                    context,
                                                    listen: false)
                                                .startLoading();
                                            loginSMS(context);
                                          } catch (e) {
                                            Provider.of<RegistrationProvider>(
                                                    context,
                                                    listen: false)
                                                .stopLoading();
                                            _showMessage(e.toString());
                                          }
                                        },
                                  minWidth: 200.0,
                                  elevation: 0.0,
                                  height: 42.0,
                                  child: (value.loading == true ||
                                          Provider.of<RegistrationProvider>(
                                                  context)
                                              .isLoading)
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ))
                                      : Text(
                                          S.of(context).createAnAccount,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${S.of(context).or} ',
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final canPop =
                                          ModalRoute.of(context)!.canPop;
                                      if (canPop) {
                                        Navigator.pop(context);
                                      } else {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                RouteList.login);
                                      }
                                    },
                                    child: Text(
                                      S.of(context).loginToYourAccount,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
