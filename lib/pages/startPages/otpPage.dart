import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kmrl_connect_to_business/pages/startPages/login_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/widgets/header_login.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';
import 'package:kmrl_connect_to_business/widgets/smartWidgets/otpbox.dart';

class OTPVerifyView extends GetView<LoginController> {
  const OTPVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderLogin(),
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Text('Verify', style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(child: Container()),

          // Expanded(child: Container()),
          Expanded(child: Container()),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.16),
              child: RichText(
                  text: TextSpan(
                      text:
                          'Please enter the 6 digit code we send to your registered ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontWeight: FontWeight.w300),
                      children: [
                    TextSpan(text: 'mobile number '),
                    TextSpan(
                        text: "${controller.getMobileMasked()}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ])),
            ),
          ),
          OTPBox(
            controller: TextEditingController(text: controller.otp),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'If you do not receive the code,',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                        color: Colors.grey[350],
                      ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend OTP',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(child: Container()),
          Center(
              child:
                  //  _formKey.currentState!.validate()
                  //     ?
                  EnabledButton(
            text: 'VERIFY',
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              controller.verifyOTP();
              // }
            },
            //   )
            // : DisabledButton(
            //     text: 'VERIFY',
          )),
          Center(
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Register Now?',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                )),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
