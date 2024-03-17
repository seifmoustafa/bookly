import 'package:bookly/Features/search/presentation/manage/searched_book_cubit/searched_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return TextField(
      controller: textEditingController,
      onSubmitted: (value) {
        _searchBooks(context, value);
        textEditingController.clear();
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlinInputBorder(),
        focusedBorder: buildOutlinInputBorder(),
        hintText: 'Search',
        prefixIcon: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _searchBooks(context, textEditingController.text);
            textEditingController.clear();
          },
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlinInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }

  void _searchBooks(BuildContext context, String data) {
    BlocProvider.of<SearchedBookCubit>(context)
        .fetchSearchedBooks(categoryName: data);
  }
}
