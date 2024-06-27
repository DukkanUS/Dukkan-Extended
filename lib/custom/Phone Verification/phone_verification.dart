import 'dart:async';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/inspireui.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../app.dart';
import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../generated/l10n.dart';
import '../../models/index.dart';
import '../../screens/login_sms/login_sms_screen.dart';
import '../../screens/login_sms/login_sms_viewmodel.dart';
import '../../services/services.dart';
import '../../widgets/common/flux_image.dart';
import '../../widgets/common/login_animation.dart';
import '../providers/registration_provider.dart';


class PhoneVerificationArguments {
  final Future<void> Function(String test)? onVerifySuccessCallBack;
  final VoidCallback? updateBusEvent;
  PhoneVerificationArguments(this.onVerifySuccessCallBack, this.updateBusEvent);
}


class PhoneVerification extends StatefulWidget {
  final bool enableRegister;
  final Future<void> Function(String test)? onVerifySuccessCallBack;
  final VoidCallback? updateBusEvent;


  const PhoneVerification({this.enableRegister = false, this.onVerifySuccessCallBack, this.updateBusEvent});


  @override
  PhoneVerificationState createState() => PhoneVerificationState();
}

class PhoneVerificationState<T extends PhoneVerification> extends State<T>
    with TickerProviderStateMixin {
  late AnimationController _loginButtonController;
  final TextEditingController _controller = TextEditingController(text: '');

  LoginSmsViewModel get viewModel => context.read<LoginSmsViewModel>();

  void loginSMS(context) {
    if (viewModel.phoneNumber.isEmpty) {
      Tools.showSnackBar(ScaffoldMessenger.of(context),
          S.of(context).pleaseInputFillAllFields);
    } else {
      Future autoRetrieve(String verId) {
        return stopAnimation();
      }

      Future smsCodeSent(String verId, [int? forceCodeResend]) {
        stopAnimation();
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomVerifyPhoneNumber(
              verId: verId,
              phoneNumber: viewModel.phoneFullText,
              verifySuccessStream: viewModel.getStreamSuccess,
              resendToken: forceCodeResend,
              onVerifySuccessTORENAME:(phone)async {
                 await widget.onVerifySuccessCallBack!(phone);

                },
              updateBusEvent: widget.updateBusEvent,
            ),
          ),
        );
      }

      void verifyFailed(exception) {
        stopAnimation();
        failMessage(exception.toString(), context);
      }

      viewModel.verify(
        autoRetrieve: autoRetrieve,
        smsCodeSent: smsCodeSent,
        verifyFailed: verifyFailed,
        startVerify: playAnimation,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.updateCountryCode(
        code: LoginSMSConstants.countryCodeDefault,
        dialCode: LoginSMSConstants.dialCodeDefault,
        name: LoginSMSConstants.nameDefault,
      );
    });

    _loginButtonController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    if (_controller.text != '') {
      viewModel.updatePhone(_controller.text.removeLeadingZeros());
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onChanged);
    _loginButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context, listen: false);
    final themeConfig = appModel.themeConfig;

    return WillPopScopeWidget(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: GestureDetector(),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0.0,
          // actions: !Services().widget.isRequiredLogin &&
          //     !ModalRoute.of(context)!.canPop
          //     ? [
          //   IconButton(
          //       onPressed: _onClose,
          //       icon: const Icon(Icons.close, size: 25))
          // ]
          //     : null,
        ),
        body: SafeArea(
          child: Consumer<LoginSmsViewModel>(
            builder: (context, viewmodel, child) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 80.0),
                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: FluxImage(
                        imageUrl: themeConfig.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 120.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: CountryCodePicker(
                            countryFilter: const ['US','JO'],
                            onChanged: (CountryCode? countryCode) =>
                                viewModel.updateCountryCode(
                                  code: countryCode?.code,
                                  dialCode: countryCode?.dialCode,
                                  name: countryCode?.name,
                                ),
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: viewModel.countryCode,
                            onInit: (countryCode) => viewModel.loadConfig(
                              code: countryCode?.code,
                              dialCode: countryCode?.dialCode,
                              name: countryCode?.name,
                            ),
                            //Get the country information relevant to the initial selection
                            backgroundColor:
                            Theme.of(context).colorScheme.background,
                            dialogBackgroundColor:
                            Theme.of(context).dialogBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextField(
                            decoration:
                            InputDecoration(labelText: S.of(context).phone),
                            keyboardType: TextInputType.phone,
                            controller: _controller,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 60),
                    StaggerAnimation(
                      titleButton: S.of(context).sendSMSCode,
                      buttonController:
                      _loginButtonController.view as AnimationController,
                      onTap: () {
                        try{
                          loginSMS(context);
                        }catch(e,trace){
                          printLog(e.toString());
                          printLog(trace.toString());
                        }
                      },
                    ),
                    if (widget.enableRegister)
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          SizedBox(
                              height: 50.0,
                              width: 200.0,
                              child: Divider(color: Colors.grey.shade300)),
                          Container(
                              height: 30,
                              width: 40,
                              color: Theme.of(context).colorScheme.background),
                          Text(
                            S.of(context).or,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade400),
                          )
                        ],
                      ),
                    if (widget.enableRegister)
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(S.of(context).dontHaveAccount),
                              GestureDetector(
                                onTap: () {
                                  NavigateTools.navigateRegister(context);
                                },
                                child: Text(
                                  ' ${S.of(context).signup}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<bool> playAnimation() async {
    try {
      viewModel.enableLoading();
      await _loginButtonController.forward();
      return true;
    } on TickerCanceled {
      printLog('[_playAnimation] error');
      return false;
    }
  }

  Future stopAnimation() async {
    try {
      await _loginButtonController.reverse();
      viewModel.enableLoading(false);
    } on TickerCanceled {
      printLog('[_stopAnimation] error');
    }
  }

  void failMessage(message, context) {
    /// Showing Error messageSnackBarDemo
    /// Ability so close message
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

  Future _onClose() async {
    await Navigator.of(App.fluxStoreNavigatorKey.currentContext!)
        .pushReplacementNamed(RouteList.dashboard);
  }
}


class CustomVerifyPhoneNumber extends StatefulWidget {
  final String? phoneNumber;
  final String? verId;
  final Stream<String?>? verifySuccessStream;
  final int? resendToken;
  final Function(String, User?)? callback;
  final VoidCallback? updateBusEvent;
  final Future<void> Function(String test)? onVerifySuccessTORENAME;

  const CustomVerifyPhoneNumber({
    this.verId,
    this.phoneNumber,
    this.verifySuccessStream,
    this.resendToken,
    this.callback, this.onVerifySuccessTORENAME, this.updateBusEvent,
  });

  @override
  State<CustomVerifyPhoneNumber> createState() => _CustomVerifyPhoneNumberState();
}

class _CustomVerifyPhoneNumberState extends State<CustomVerifyPhoneNumber>
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

        if(widget.updateBusEvent != null){
          widget.updateBusEvent!();
        }
        if(widget.onVerifySuccessTORENAME != null) {
          await widget.onVerifySuccessTORENAME!(widget.phoneNumber ?? '');
        }
        await _stopAnimation();
      } else {
        await _stopAnimation();

        throw Exception(S.of(context).invalidSMSCode);
      }
    } catch (e,trace) {
      await _stopAnimation();
      printLog(e.toString());
      printLog(trace.toString());
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
