import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/book_details_controller.dart';
import '../../utils/constants.dart';
import 'components/bookMark_button.dart';
import 'components/book_cover_and_title.dart';
import 'components/book_info.dart';
import 'components/open_url_button.dart';

class BookDetailsPage extends GetView<BookDetailsController> {
  const BookDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3F3D56),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 15),
            child: Obx(
              () {
                return BookMarkButton(
                  isFavorite: controller.favorite,
                  onPressed: () => controller.toogleFavorite(),
                );
              },
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 15),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            BookCoverAndTitle(
              image: controller.book.volumeInfo?.imageLinks?.thumbnail ?? imagePlaceholder,
              tag: controller.index,
              title: controller.book.volumeInfo?.title ?? '',
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: Get.height * .6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookInfo(
                        authors: controller.book.volumeInfo?.authors?.join(' - ') ?? '',
                        description: controller.book.volumeInfo?.description ?? 'No description available',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          OpenUrlButton(
                            title: 'Buy',
                            color: Colors.blue,
                            onPressed: () => controller.openBookURL(url: controller.book.volumeInfo?.infoLink ?? ''),
                          ),
                          const SizedBox(width: 15),
                          OpenUrlButton(
                            title: 'Preview',
                            color: const Color(0xff3F3D56),
                            onPressed: () => controller.openBookURL(url: controller.book.volumeInfo?.previewLink ?? ''),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
