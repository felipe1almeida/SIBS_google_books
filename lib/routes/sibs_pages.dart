import 'package:get/get.dart';

import '../bindings/book_details_bindings.dart';
import '../bindings/books_list_bindings.dart';
import '../pages/book_details/book_details_page.dart';
import '../pages/books_List/books_list_page.dart';

class SibsPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => const BooksListPage(),
      binding: BooksListBindings(),
    ),
    GetPage(
      name: '/book_details',
      page: () => const BookDetailsPage(),
      binding: BookDetailsBindings(),
    ),
  ];
}
