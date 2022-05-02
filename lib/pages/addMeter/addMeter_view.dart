import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/amenities.dart';
import 'package:kmrl_connect_to_business/widgets/dateWidget.dart';
import 'package:kmrl_connect_to_business/widgets/disabledButton.dart';
import 'package:kmrl_connect_to_business/widgets/enabled_button.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/reading.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'addMeter_controller.dart';

class AddMeterView extends GetView<AddMeterController> {
  AddMeterView() {
    Get.put(AddMeterController());
  }
  Future getImage(ImgSource source, BuildContext context) async {
    var image = await ImagePickerGC.pickImage(
        enableCloseButton: true,
        closeIcon: Icon(
          Icons.close,
          color: Colors.red,
          size: 20,
        ),
        context: context,
        source: source,
        barrierDismissible: true,
        cameraIcon: Icon(
          Icons.camera_alt,
          color: darkBlueColor,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: kPrimaryColor),
        ),
        galleryIcon: Icon(
          Icons.photo_size_select_actual_rounded,
          color: darkBlueColor,
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: kPrimaryColor),
        ));
    controller.thisImage = image;
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.addMeterScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle(onTapped: () => Get.toNamed(Routes.PROFILE))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeaderTitle(
                title: 'Meter Reading',
                subTitle: 'Select Amenities',
                image: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: KmrlIcons.meterBig(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03),
                child: GetBuilder<AddMeterController>(builder: (context) {
                  return Row(
                    children: [
                      Visibility(
                        visible:
                            controller.type == "Electricity" ? true : false,
                        child: AmenitiesSel(
                          title: 'Electricity',
                          onTap: () {
                            controller.getType(1);
                            controller.update();
                          },
                          image: 'assets/images/electricBulb.png',
                          bgcolor: kPrimaryColor,
                        ),
                      ),
                      Visibility(
                        visible:
                            controller.type == "Electricity" ? false : true,
                        child: Amenities2(
                          title: 'Electricity',
                          onTap: () {
                            controller.getType(1);
                            controller.update();
                          },
                          image: 'assets/images/electricBulb.png',
                        ),
                      ),
                      Visibility(
                        visible: controller.type == "Water" ? true : false,
                        child: AmenitiesSel(
                          title: 'Water',
                          onTap: () {
                            controller.getType(2);
                            controller.update();
                          },
                          image: 'assets/images/waterecharge.png',
                          bgcolor: kPrimaryColor,
                        ),
                      ),
                      Visibility(
                        visible: controller.type == "Water" ? false : true,
                        child: Amenities2(
                          title: 'Water',
                          onTap: () {
                            controller.getType(2);
                            controller.update();
                          },
                          image: 'assets/images/waterecharge.png',
                        ),
                      ),
                    ],
                  );
                }),
              ),
              DateWidget(),
              Reading(
                title: 'Previous Reading',
                reading: '005333',
                enabled: false,
              ),
              Reading(
                title: 'Current Reading',
                reading: '005333',
                enabled: true,
              ),
              uploadPhoto(context),
              buttons(context)
            ],
          ),
        ));
  }

  Widget uploadPhoto(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                // top: MediaQuery.of(context).size.width * 0.03,
                bottom: MediaQuery.of(context).size.width * 0.03),
            child: Text('Upload Photo',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400)),
          ),
          Container(
              decoration: BoxDecoration(
                  color: boxBgGrey, borderRadius: BorderRadius.circular(5)),
              child: IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  icon: ImageIcon(
                    AssetImage('assets/images/camera.png'),
                    color: kPrimaryColor,
                  ),
                  onPressed: () async {
                    await getImage(ImgSource.Both, context);
                  }))
        ],
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Container(
        child: Row(children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: EnabledButton(
            onPressed: () {},
            text: 'SUBMIT',
            color: Colors.red,
            size: 16,
          )),
      Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: DisabledButton(text: 'CANCEL', size: 16, onPressed: () {}))
    ]));
  }
}
