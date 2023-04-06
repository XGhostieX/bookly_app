import 'package:flutter/material.dart';

import '../../../../../core/utils/functions/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/models/book_model/book_model.dart';

class BookActions extends StatelessWidget {
  final BookModel book;
  const BookActions({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              text: book.volumeInfo.previewLink == null
                  ? 'Not Available'
                  : 'Preview',
              backgroundColor: const Color(0xFFEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: () {
                launchCustomUrl(context, book.volumeInfo.previewLink);
              },
            ),
          ),
        ],
      ),
    );
  }
}
