import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_controller.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class ExpansionContainer extends StatelessWidget {
  const ExpansionContainer({
    Key? key,
    required this.expanded,
  }) : super(key: key);
  final bool expanded;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDashboardController>(builder: (controller) {
      return controller.contractList.isEmpty
          ? Container()
          : Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: KmrlIcons.userPicBig(),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.customerList[0].name,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(controller.mobile,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    // width: double.infinity,
                    decoration: BoxDecoration(
                        color: kLightPrimaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 16, right: 16, bottom: 10.0),
                    margin: EdgeInsets.zero,
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (bool value) {
                          controller.expanded = value;
                          controller.update();
                        },
                        title: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LEASE, arguments: {
                              "material_no": controller
                                  .contractList[0].materialNo
                                  .toString()
                            });
                          },
                          child: Text(
                              "You have ${controller.contractList.length} Active location.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: darkBlueColor)),
                        ),
                        trailing: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: lightBlueColor.withOpacity(0.3),
                          ),
                          child: Icon(
                            !expanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        children: [
                          ListView.builder(
                              itemCount: controller.contractList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.LEASE, arguments: {
                                        "material_no": controller
                                            .contractList[index].materialNo
                                            .toString()
                                      });
                                    },
                                    title: Text(
                                        controller
                                            .contractList[index].spaceLocation
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                    subtitle: Text(
                                        controller
                                            .contractList[index].materialNo
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: textgreyColor)));
                              }),
                        ],
                      ),
                    ),
                  )

                  // DropdownButtonHideUnderline(
                  //   child: DropdownButton<String>(
                  //       icon: Padding(
                  //         padding: const EdgeInsets.only(right: 7.0),
                  //         child: Icon(
                  //           Icons.arrow_drop_down,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //       hint: Text('Select a category'),
                  //       value: controller.value,
                  //       items: controller.contractSpaceLoc
                  //           .map(
                  //             (item) => DropdownMenuItem<String>(
                  //               child: Text(item),
                  //               value: item,
                  //             ),
                  //           )
                  //           .toList(),
                  //       onChanged: (value) {
                  //         controller.value = value!;
                  //         controller.update();
                  //       }),
                  // ),
                ],
              ));
    });
  }

  Widget buildRichText({text1, text2}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: RichText(
        text: TextSpan(
            text: '$text1',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textgreyColor),
            children: [
              TextSpan(
                  text: '$text2',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff025975)))
            ]),
      ),
    );
  }
}
