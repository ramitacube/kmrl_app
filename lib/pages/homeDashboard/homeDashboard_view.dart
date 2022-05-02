import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/drawer/drawer_view.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/expansion_container_widget.dart';
import 'package:kmrl_connect_to_business/widgets/home_widgets/manageAmenities.dart';
import 'package:kmrl_connect_to_business/widgets/home_widgets/manageAssets.dart';
import 'package:kmrl_connect_to_business/widgets/pendingInvoices.dart';

import 'homeDashboard_controller.dart';

class HomeDashboardView extends GetView<HomeDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.key,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        drawer: DrawerWidget(
          onPageChange: (index) {
            controller.updateBottomNavIndex(index);
          },
        ),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: Container(
                padding: EdgeInsets.only(top: 42, right: 5),
                child: ListTile(
                  leading: Container(
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          controller.key.currentState!.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Colors.black,
                          size: 36,
                        )),
                  ),
                  title: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: KmrlIcons.logoSmall(),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Connect to ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1!
                                          .copyWith(fontSize: 24),
                                      children: [
                                        TextSpan(
                                          text: 'Business',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 24),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    // margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                  'One App for Enterprise Property Management',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 10),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    child: Stack(
                      children: [
                        Icon(
                          Icons.notifications,
                          size: 48,
                          color: Colors.black,
                        ),
                        Positioned(
                          right: 0,
                          top: 1,
                          child: Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: kPrimaryColor),
                              child: Center(
                                  child: Text('2',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.white,
                                              fontSize: 16)))),
                        )
                      ],
                    ),
                  ),
                ))),
        body: GetBuilder<HomeDashboardController>(builder: (controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionContainer(
                  expanded: controller.expanded,
                ),
                PendingInvoicesWidget(),
                ManageAssets(),
                ManageAmenities(),
              ],
            ),
          );
        }));
  }
}
