import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/addMeter/addMeter_binding.dart';
import 'package:kmrl_connect_to_business/pages/addMeter/addMeter_view.dart';
import 'package:kmrl_connect_to_business/pages/balance/balance_binding.dart';
import 'package:kmrl_connect_to_business/pages/balance/balance_view.dart';
import 'package:kmrl_connect_to_business/pages/electricity/electricity_binding.dart';
import 'package:kmrl_connect_to_business/pages/electricity/electricity_view.dart';
import 'package:kmrl_connect_to_business/pages/helpDesk/help_binding.dart';
import 'package:kmrl_connect_to_business/pages/helpDesk/help_view.dart';
import 'package:kmrl_connect_to_business/pages/home/home_binding.dart';
import 'package:kmrl_connect_to_business/pages/home/home_view.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_binding.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_view.dart';
import 'package:kmrl_connect_to_business/pages/invoice/invoice_binding.dart';
import 'package:kmrl_connect_to_business/pages/invoice/invoice_view.dart';
import 'package:kmrl_connect_to_business/pages/lease/lease_binding.dart';
import 'package:kmrl_connect_to_business/pages/lease/lease_view.dart';
import 'package:kmrl_connect_to_business/pages/leaseDetails/leaseDetails_view.dart';
import 'package:kmrl_connect_to_business/pages/leaseDetails/leaseDetialsBinding.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_binding.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_view.dart';
import 'package:kmrl_connect_to_business/pages/payment/payment_binding.dart';
import 'package:kmrl_connect_to_business/pages/payment/payment_view.dart';
import 'package:kmrl_connect_to_business/pages/profile/profile_binding.dart';
import 'package:kmrl_connect_to_business/pages/profile/profile_view.dart';
import 'package:kmrl_connect_to_business/pages/splash/splash_binding.dart';
import 'package:kmrl_connect_to_business/pages/splash/splash_view.dart';
import 'package:kmrl_connect_to_business/pages/startPages/launch_view.dart';
import 'package:kmrl_connect_to_business/pages/startPages/login_view.dart';
import 'package:kmrl_connect_to_business/pages/startPages/otpPage.dart';
import 'package:kmrl_connect_to_business/pages/startPages/register_view.dart';
import 'package:kmrl_connect_to_business/pages/ticketPage/ticket_binding.dart';
import 'package:kmrl_connect_to_business/pages/ticketPage/ticket_view.dart';
import 'package:kmrl_connect_to_business/pages/water/water_binding.dart';
import 'package:kmrl_connect_to_business/pages/water/water_view.dart';

import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.LAUNCH,
      page: () => LaunchView(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OTPVerifyView(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LEASEDETAILS,
      page: () => LeaseDetailsView(),
      binding: LeaseDetailsBinding(),
    ),
    GetPage(
      name: Routes.LEASE,
      page: () => LeaseView(),
      binding: LeaseBinding(),
    ),
    GetPage(
      name: Routes.INVOICE,
      page: () => InvoiceView(disableBack: false),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT,
      page: () => PaymentsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: Routes.BALANCE,
      page: () => BalanceView(),
      binding: BalanceBinding(),
    ),
    GetPage(
      name: Routes.ELECTRICITY,
      page: () => ElectricityView(disableBack: false),
      binding: ElectricityBinding(),
    ),
    GetPage(
      name: Routes.METER,
      page: () => MeterView(disableBack: false),
      binding: MeterBinding(),
    ),
    GetPage(
      name: Routes.WATER,
      page: () => WaterView(disableBack: false),
      binding: WaterBinding(),
    ),
    GetPage(
      name: Routes.ADDMETER,
      page: () => AddMeterView(),
      binding: AddMeterBinding(),
    ),
    GetPage(
      name: Routes.HELPDESK,
      page: () => HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: Routes.ADDTICKET,
      page: () => TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.HOMEDASHBOARD,
      page: () => HomeDashboardView(),
      binding: HomeDashboardBinding(),
    ),
  ];
}
