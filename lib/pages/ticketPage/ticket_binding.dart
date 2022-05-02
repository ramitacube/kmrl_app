import 'package:get/get.dart';

import 'ticket_controller.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TicketController>(TicketController());
  }
}
