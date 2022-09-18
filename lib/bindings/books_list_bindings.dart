import 'package:get/instance_manager.dart';

import '../controllers/books_list_controller.dart';

class BooksListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      BooksListController(
        booksRepository: Get.find(),
      ),
    );
  }
}
