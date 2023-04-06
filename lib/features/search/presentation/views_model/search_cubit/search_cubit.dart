import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchBooks({required String search}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchBooks(search: search);
    result.fold(
      (failure) => emit(SearchFailure(failure.errMsg)),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
