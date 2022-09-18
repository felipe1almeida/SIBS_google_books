import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCoverAndTitle extends StatelessWidget {
  final int tag;
  final String image;
  final String title;

  const BookCoverAndTitle({
    Key? key,
    required this.tag,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * .3,
      decoration: const BoxDecoration(),
      child: Center(
        child: Column(
          children: [
            Hero(
              tag: tag,
              child: Image.network(
                image,
                fit: BoxFit.scaleDown,
                height: 200,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
