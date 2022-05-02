import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class HeaderTitle extends StatelessWidget {
  final onTapped;
  final disableBack;
  const HeaderTitle({Key? key, this.onTapped, this.disableBack = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDashboardController>(builder: (controller) {
      return Container(
          padding: EdgeInsets.only(top: 42, left: 15, right: 15),
          child: ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                disableBack == true
                    ? Container()
                    : InkWell(
                        onTap: () => Get.back(),
                        child: Icon(Icons.arrow_back_ios)),
                InkWell(
                  onTap: onTapped,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: KmrlIcons.userPic(),
                  ),
                ),
              ],
            ),
            title: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text('${controller.customerName}')),
            subtitle: Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  '+91 ${controller.sharedPreferenceHelper.mobile}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 14),
                )),
            trailing: Container(
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 48,
                    color: Colors.black,
                  ),
                  Visibility(
                    visible: false,
                    child: Positioned(
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
                                          color: Colors.white, fontSize: 16)))),
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
