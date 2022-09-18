import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sibs_books/utils/constants.dart';

import '../../../controllers/books_list_controller.dart';

class GridBookList extends GetView<BooksListController> {
  final List? books;

  const GridBookList({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          controller: controller.scroll,
          itemCount: books?.length ?? 0,
          itemBuilder: (context, index) {
            return InkWell(
              child: Hero(
                tag: index,
                child: Image.network(
                  books?[index].volumeInfo?.imageLinks?.thumbnail ?? imagePlaceholder,
                ),
              ),
              onTap: () => Get.toNamed('/book_details', arguments: [books?[index], index]),
            );
          },
        );
      },
    );
  }
}
