import 'package:bookly/Features/search/data/repos/search_repos.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_book_state.dart';

class SearchedBookCubit extends Cubit<SearchedBookState> {
  SearchedBookCubit(this.searchRepos) : super(SearchedBookInitial());
  final SearchRepos searchRepos;

  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchedBookLoading());
    var result = await searchRepos.fetchSearchedBooks(bookName: bookName);
    result.fold((failure) {
      emit(SearchedBookFailure(failure.errMessage));
    }, (books) {
      emit(SearchedBookSuccess(books));
    });
  }
}
