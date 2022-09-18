import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sibs_books/utils/constants.dart';

import '../repositories/books_repository.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => Dio(BaseOptions(baseUrl: baseUrl)),
      fenix: true,
    );
    Get.lazyPut(
      () => BooksRepository(dio: Get.find()),
      fenix: true,
    );
  }
}
