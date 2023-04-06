import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'search_list_view.dart';
import 'search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextField(),
          const SizedBox(height: 16),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 16),
          const Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
