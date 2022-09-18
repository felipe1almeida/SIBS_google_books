import 'package:get/get.dart';

import '../controllers/book_details_controller.dart';

class BookDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => BookDetailsController(),
    );
  }
}
