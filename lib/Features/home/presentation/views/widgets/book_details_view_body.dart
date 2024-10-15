import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bookly/core/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similat_books_section.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomBookDetailsAppBar(),
                ),
              ),
              BookDetailsSection(
                book: bookModel,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const SimilarBooksSection(),
            ],
          ),
        )
      ],
    );
    // retur n ;
  }
}
