import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similat_books_section.dart';
import 'package:bookly/Features/search/presentation/manage/searched_book_cubit/searched_book_cubit.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBookCubit, SearchedBookState>(
      builder: (context, state) {
        if (state is SearchedBookSuccess) {
          return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.bookModel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // child: BookListViewItem(bookModel: ,),
                  child: BookListViewItem(bookModel: state.bookModel[index]),
                );
              });
        } else if (state is SearchedBookFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
