import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPBox extends StatelessWidget {
  const OTPBox({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.05),
        child: PinCodeTextField(
          appContext: context,
          enablePinAutofill: true,
          pastedTextStyle: TextStyle(
            color: Colors.red.shade600,
            fontWeight: FontWeight.bold,
          ),
          controller: controller,
          length: 6,
          obscureText: true,
          obscuringCharacter: '*',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 5) {
              return "Invalid OTP";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(15),
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            activeColor: kPrimaryColor,
            inactiveColor: kPrimaryColor,
            selectedColor: kPrimaryColor,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
          ),
          cursorColor: Colors.black,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          // errorAnimationController: errorController,
          // controller: textEditingController,
          keyboardType: TextInputType.number,

          onCompleted: (v) {
            print("Completed");
          },
          // onTap: () {
          //   print("Pressed");
          // },
          onChanged: (value) {
            // print(value);
            // setState(() {
            //   currentText = value;
            // });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ));
  }
}
