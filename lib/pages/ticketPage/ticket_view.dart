import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'ticket_controller.dart';

class TicketView extends GetView<TicketController> {
  TicketView() {
    Get.put(TicketController());
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        key: controller.ticketScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(h * 0.12), child: HeaderTitle()),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SubHeaderTitle(
                    title: 'Help Desk',
                    subTitle: 'Grievances & Support',
                    image: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: KmrlIcons.helpDeskBig(),
                    ),
                  ),
                  // Expanded(child: Container()),
                  // Container(
                  //   margin: EdgeInsets.only(right: 20),
                  //   child: InkWell(
                  //       onTap: () {},
                  //       borderRadius: BorderRadius.circular(5),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Image.asset('assets/images/chatPlus.png'),
                  //           Text('New',
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .subtitle1!
                  //                   .copyWith(
                  //                       fontSize: 10, color: kPrimaryColor))
                  //         ],
                  //       )),
                  // )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: w * 0.05, top: h * 0.05, bottom: h * 0.01),
                  child: Text('Submit New Ticket',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 18,
                          color: darkBlueColor,
                          fontWeight: FontWeight.bold))),
              ticketForm(context),
              Center(
                child: EnabledButton(
                  onPressed: () {
                    controller.submitTicket();
                  },
                  text: 'SUBMIT TICKET',
                  // color: Colors.red,
                ),
              )
            ],
          ),
        ));
  }

  Widget ticketForm(BuildContext context) {
    return GetBuilder<TicketController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Form(
          key: controller.ticketFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.03),
                child: Text('Category',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        // labelStyle: textStyle,
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: '   Select Category',
                        hintStyle: Theme.of(Get.context!)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                color: Colors.black26,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                    isEmpty: controller.category == null,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.category,
                        isDense: true,
                        onChanged: (val) {
                          controller.category = val;
                          controller.update();
                        },
                        icon:
                            Icon(Icons.arrow_drop_down, color: lightBlueColor),
                        iconSize: 36.0,
                        items: controller.items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(
                    // left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.width * 0.03,
                    bottom: MediaQuery.of(context).size.width * 0.03),
                child: Text('Description',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              TextFormField(
                // controller: ,
                onChanged: (value) {
                  controller.description = value;
                  controller.update();
                },
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter
                ],
                validator: (value) {
                  if (value!.length < 3) {
                    return "Description can not be null";
                  } else {
                    return null;
                  }
                },
                minLines: 5,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: 'Issue Description',
                    hintStyle: Theme.of(Get.context!)
                        .textTheme
                        .bodyText2
                        ?.copyWith(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: new BorderRadius.circular(5.0),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
