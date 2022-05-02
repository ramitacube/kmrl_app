import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/shared_preference_helper.dart';

class HomeController extends BaseController {
  var bottomNavIndex = 0;
  late SharedPreferenceHelper sharedPreferenceHelper;
  updateBottomNavIndex(var index) {
    bottomNavIndex = index;
    update();
  }
}
