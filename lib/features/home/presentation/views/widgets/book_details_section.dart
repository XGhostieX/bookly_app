import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/models/book_model/book_model.dart';
import 'book_actions.dart';
import 'book_item.dart';
import 'book_rating.dart';
import 'custom_book_app_bar.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
  const BookDetailsSection({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.2),
          child: BookItem(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 40),
        Text(
          book.volumeInfo.title!,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 48,
          count: book.volumeInfo.ratingsCount ?? 2034,
        ),
        const SizedBox(height: 37),
        BookActions(book: book),
      ],
    );
  }
}
