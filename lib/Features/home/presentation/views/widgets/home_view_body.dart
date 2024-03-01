import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: FeaturedBooksListView(),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
        )
      ],
    );
  }
}