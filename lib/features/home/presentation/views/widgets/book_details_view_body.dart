import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/book_model/book_model.dart';
import 'book_details_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel book;
  const BookDetailsViewBody({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                BookDetailsSection(book: book),
                const Expanded(child: SizedBox(height: 50)),
                const SimilarBooksSection(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
