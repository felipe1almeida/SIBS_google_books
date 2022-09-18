import 'package:flutter/material.dart';

class BookMarkButton extends StatelessWidget {
  final Function() onPressed;
  final bool isFavorite;

  const BookMarkButton({
    Key? key,
    required this.onPressed,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isFavorite
          ? const Icon(
              Icons.bookmark_added,
              color: Colors.yellow,
            )
          : const Icon(
              Icons.bookmark_border_outlined,
              color: Colors.white,
            ),
    );
  }
}
