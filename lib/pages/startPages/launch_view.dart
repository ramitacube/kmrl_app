import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/widgets/header_login.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';

import 'login_view.dart';
import 'register_view.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  _LaunchViewState createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderLogin(),
          Column(
            children: [
              Center(
                child: EnabledButton(
                  text: 'REGISTER',
                  onPressed: () {
                    debugPrint('Register');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterView()));
                  },
                ),
              ),
              buildUser(),
            ],
          ),
          Container(
              child: Image.asset(
            'assets/images/train.png',
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }

  buildUser() {
    return Center(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.LOGIN);
        },
        child: RichText(
            text: TextSpan(
                text: 'Registered User ?   ',
                style: TextStyle(fontSize: 20, color: lightGreenColor),
                children: [
              TextSpan(
                  text: 'LOGIN',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor))
            ])),
      ),
    );
  }
}
