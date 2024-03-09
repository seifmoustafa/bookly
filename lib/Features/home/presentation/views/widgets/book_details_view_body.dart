import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const SafeArea(
            child: CustomBookDetailsAppBar(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .17,
            ),
            child: const CustomBookImahe(),
          ),
        ],
      ),
    );
  }
}
