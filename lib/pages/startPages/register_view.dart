import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/pages/startPages/login_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/widgets/header_login.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';

// import 'login_view.dart';

class RegisterView extends GetView<LoginController> {
  RegisterView({Key? key}) : super(key: key);
  final _controller = Get.put(LoginController());
  final TextEditingController dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderLogin(),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Text('Register',
                  style: Theme.of(context).textTheme.headline6),
            ),
            SizedBox(
              height: 24,
            ),
            _getForm(context),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: CheckboxListTile(
                value: true,
                checkColor: Colors.white,
                activeColor: kPrimaryColor,
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                    text: TextSpan(
                        text: 'By proceeding, you are agreeing to our ',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 12, color: Color(0xFFC4C2C2)),
                        children: [
                      TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: 'and '),
                      TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold)),
                    ])),
                onChanged: (value) {},
              ),
            ),
            Center(
                child:
                    // _formKey.currentState!.validate()
                    // ?
                    EnabledButton(
              text: 'REGISTER',
              onPressed: () {
                // if (controller.formKey.currentState!.validate()) {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => LogVi()));
                // }
              },
            )),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Registered User?',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: Text(
                      'Login Now',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: kPrimaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getForm(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(Get.context!).size.width * 0.1),
          child: Column(
            children: [
              TextFormField(
                maxLength: 10,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value?.length != 10) {
                    return "Invalid Mobile";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    counterText: '',
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          '+91 ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    hintText: 'Enter your mobile number',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
              ),
              TextFormField(
                // controller: phoneController,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow('[a-zA-Z]')
                ],
                validator: (value) {
                  if (value!.length < 3) {
                    return "Invalid Name";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    prefixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.value ?? controller.items[0],
                        onChanged: (value) => controller.value,
                        items: controller.items
                            .map((String item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    '$item',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    hintText: 'Enter your Full Name',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
              ),
              TextFormField(
                // controller: phoneController,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                validator: (value) {
                  if (value!.length < 5) {
                    return "Invalid Email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter your email id',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
              ),
              TextFormField(
                controller: dobController,
                readOnly: true,
                keyboardType: TextInputType.datetime,
                onTap: () async {
                  await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2025))
                      .then((selectedDate) {
                    if (selectedDate != null) {
                      dobController.text =
                          DateFormat('dd-MM-yyyy').format(selectedDate);
                    }
                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                validator: (value) {
                  if (value!.length < 5) {
                    return "Invalid date of birth";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter your date of birth',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
              ),
              TextFormField(
                maxLength: 10,
                // controller: phoneController,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))
                ],
                validator: (value) {
                  if (value!.length < 5) {
                    return "Invalid Allotment Number / CID";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter your Allotment Number / CID',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        ));
  }
}
