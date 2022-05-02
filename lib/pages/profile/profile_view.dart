import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/network/shared_preference_helper.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/profileTile.dart';

import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView() {
    Get.put(ProfileController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.profileScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.black,
                    ),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  title: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Text(
                      'Profile',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15,
                          top: MediaQuery.of(context).size.height * 0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                      child: KmrlIcons.userPicBig(),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05,
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Rakesh K Chandrabose',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 20),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              'ratheeshv82@gmail.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              'Customer ID :   1184',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ProfileTile(
                  leading: 'assets/images/profileUser.png',
                  title: 'My Profile',
                  subTitle: 'Update and modify your profile',
                  onTapped: () => debugPrint('My Profile')),
              ProfileTile(
                  leading: 'assets/images/profileSettings.png',
                  title: 'Settings',
                  subTitle:
                      'Manage your payment,security,language, Notifications settings',
                  onTapped: () => debugPrint('Settings')),
              ProfileTile(
                  leading: 'assets/images/profileSupport.png',
                  title: 'Support & Feedback',
                  subTitle: 'Customer Support, Your Queries, FAQ’s',
                  onTapped: () => Get.toNamed(Routes.HELPDESK)),
              ProfileTile(
                  leading: 'assets/images/profileLogout.png',
                  title: 'Logout',
                  subTitle: 'Logout out from this device ',
                  onTapped: () {
                    Get.offAllNamed(Routes.LOGIN);
                    SharedPreferenceHelper()..removeAll();
                  }),
              Column(
                children: [
                  Container(
                    child: KmrlIcons.logo(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => debugPrint('Terms & Conditions'),
                        child: Text(
                          'Terms & Conditions',
                          style: TextStyle(color: darkBlueColor),
                        ),
                      ),
                      Text(' | ', style: TextStyle(color: darkBlueColor)),
                      InkWell(
                        onTap: () => debugPrint('Privacy Policy'),
                        child: Text('Privacy Policy',
                            style: TextStyle(color: darkBlueColor)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Version 1.20.1',
                        style: TextStyle(color: Color(0xff7F7D7D7D))),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
