import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:kmrl_connect_to_business/styles/colors.dart';

class Reading extends StatelessWidget {
  Reading({
    Key? key,
    required this.reading,
    required this.title,
    required this.enabled,
  }) : super(key: key);

  final String reading;
  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: reading);

    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        top: MediaQuery.of(context).size.width * 0.03,
        // bottom: MediaQuery.of(context).size.width * 0.05
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(
              // left: MediaQuery.of(context).size.width * 0.05,
              // top: MediaQuery.of(context).size.width * 0.03,
              bottom: MediaQuery.of(context).size.width * 0.03),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        Container(
          margin: EdgeInsets.only(
              // left: MediaQuery.of(context).size.width * 0.05,
              // top: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.05),
          child: PinCodeTextField(
            enabled: enabled,
            appContext: context,
            enablePinAutofill: true,
            textStyle: TextStyle(color: enabled ? Colors.black : darkBlueColor),
            pastedTextStyle: TextStyle(
              color: Colors.red.shade600,
              fontWeight: FontWeight.bold,
            ),
            controller: controller,
            length: 6,
            obscureText: false,
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
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 50,
              fieldWidth: 50,
              disabledColor: boxBgGrey,
              activeFillColor: Colors.white,
              activeColor: enabled ? boxBgGrey : kPrimaryColor,
              inactiveColor: enabled ? boxBgGrey : kPrimaryColor,
              selectedColor: enabled ? boxBgGrey : kPrimaryColor,
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
          ),
        )
      ]),
    );
  }
}
