import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kmrl_connect_to_business/routes/app_pages.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      home: Container(),
      title: 'Kochi Metro Rail Ltd.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.light(primary: const Color(0xFF01B1AF)),
        textTheme: TextTheme(
          headline1: GoogleFonts.adventPro(
            textStyle: TextStyle(fontSize: 36),
          ),
          headline2: GoogleFonts.adventPro(
            textStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          headline3: GoogleFonts.adventPro(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: darkBlueColor),
          ),
          headline4: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 16, color: darkBlueColor),
          ),
          headline5: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          headline6: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: lightGreenColor),
          ),
          bodyText2: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: 14),
          ),
          subtitle1: GoogleFonts.ubuntu(
            textStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          subtitle2: GoogleFonts.ubuntu(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: lightGreyColor),
          ),
        ),
      ),
      // defaultTransition: Transition.cupertino,
      // opaqueRoute: Get.isOpaqueRouteDefault,
      // popGesture: Get.isPopGestureEnable,
      // transitionDuration: Duration(milliseconds: 230),
      initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    );
  }
}
