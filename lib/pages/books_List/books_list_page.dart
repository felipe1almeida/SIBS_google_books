import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibs_books/pages/books_List/components/error_page.dart';

import '../../controllers/books_list_controller.dart';
import '../book_details/components/bookMark_button.dart';
import 'components/grid_book_list.dart';
import 'components/loading_progress_page.dart';

class BooksListPage extends GetView<BooksListController> {
  const BooksListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3F3D56),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Obx(
          () => Text(controller.tooglePage ? 'Favorites' : 'Google Books'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 15),
            child: BookMarkButton(
              isFavorite: controller.hasFavorite,
              onPressed: () => controller.toogleFavoriteBtn(),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(() => LoadingProgress(isLoading: controller.isLoading)),
          GridBookList(books: controller.books),
          Obx(
            () => Visibility(
              visible: controller.hasError,
              child: ErrorView(onPressed: () => controller.retryRequest()),
            ),
          ),
        ],
      ),
    );
  }
}
