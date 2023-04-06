import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../home/presentation/views/widgets/best_seller_item.dart';
import '../../views_model/search_cubit/search_cubit.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => BestSellerItem(
              book: state.books[index],
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errMsg: state.errMsg);
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              "Don't Judge a Book by Its Cover",
              style: Styles.textStyle18,
            ),
          );
        }
      },
    );
  }
}
