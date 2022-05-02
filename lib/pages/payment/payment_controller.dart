import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/payments_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class PaymentController extends BaseController {
  List<PaymentData> paymentList = [];
  final bool expanded = false;
  final bool paidExpanded = false;
  @override
  Future onInit() async {
    super.onInit();
    getPayments();
  }

  Future<void> getPayments() async {
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var res = await apiClient.get(EndPoints.getPaymnets);
    if (res != null) {
      var data = PaymentsModel.fromJson(res);
      paymentList = data.data;
      update();
    }
    hideLoading();
  }

  formatDate(String? date) {
    if (date == null) {
      return "";
    }
    var formated = DateFormat("yyyy-mm-dd").parse(date);
    return DateFormat("dd-MMM-yy").format(formated);
  }
}
