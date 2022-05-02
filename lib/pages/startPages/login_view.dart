import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kmrl_connect_to_business/pages/startPages/login_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/widgets/header_login.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';

import 'register_view.dart';

class LoginView extends GetView<LoginController> {
  LoginView() {
    Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderLogin(),
            SizedBox(
              height: 32,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Text('Registered User ?',
                  style: Theme.of(context).textTheme.headline6),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Text('ENTER YOUR MOBILE NUMBER',
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            buildForm(controller.formKey, context),
            SizedBox(
              height: 32,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: RichText(
                    text: TextSpan(
                        text: 'By Continuing you may receive an ',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 12, color: Color(0xFFC4C2C2)),
                        children: [
                      TextSpan(
                          text: 'SMS ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: 'and '),
                      TextSpan(
                          text: 'Email ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'for verification. Message charges and data rates may apply.')
                    ])),
              ),
            ),
            Center(
                child: EnabledButton(
              text: 'LOGIN',
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.loginWithMobile();
                }
              },
            )),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterView()));
                  },
                  child: Text(
                    'Register Now?',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildForm(GlobalKey _formKey, BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: TextFormField(
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) {
            if (value?.length != 10) {
              return "Invalid Mobile";
            } else {
              controller.mobile = value!;
              return null;
            }
          },
          decoration: InputDecoration(
              counterText: '',
              prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15, left: 10),
                  child: Text(
                    '+91 ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              hintText: 'Enter your mobile number',
              hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Colors.black26,
                  fontSize: 16,
                  fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }
}
