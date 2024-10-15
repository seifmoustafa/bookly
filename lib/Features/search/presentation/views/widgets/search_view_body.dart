import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/Features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSearchTextField(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Search Results',
                    style: Styles.textStyle18,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(child: SearchResultListView()),
                ],
              ),
            )
          ],
        ));
  }
}
