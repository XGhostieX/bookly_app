import 'package:flutter/material.dart';

import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/book_model/book_model.dart';
import '../views_model/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  final BookModel book;
  const BookDetailsView({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      catagory: widget.book.volumeInfo.categories?[0] ?? 'Fantasy',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        book: widget.book,
      )),
    );
  }
}
