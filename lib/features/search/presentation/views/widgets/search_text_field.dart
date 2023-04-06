import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../views_model/search_cubit/search_cubit.dart';

class SearchTextField extends StatelessWidget {
  final searchController = TextEditingController();
  SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: (value) =>
          BlocProvider.of<SearchCubit>(context).fetchBooks(search: value),
      decoration: InputDecoration(
        focusedBorder: bulidOutlineInputBorder(),
        enabledBorder: bulidOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () => BlocProvider.of<SearchCubit>(context)
              .fetchBooks(search: searchController.text),
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder bulidOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
  }
}
