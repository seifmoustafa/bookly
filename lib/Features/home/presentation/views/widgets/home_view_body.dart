import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/newest_books_listview.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  HomeViewBodyState createState() => HomeViewBodyState();
}

class HomeViewBodyState extends State<HomeViewBody> {
  bool _doubleBackToExitPressedOnce = false;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _resetTimerAndSnackBar() {
    _timer.cancel(); // Cancel the timer
    setState(() {
      _doubleBackToExitPressedOnce = false; // Reset the flag
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Dismiss the SnackBar
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) async {
        if (_doubleBackToExitPressedOnce) {
          exit(0);
        } else {
          // Set the flag to true
          setState(() {
            _doubleBackToExitPressedOnce = true;
          });

          // Set a timer to reset the flag after 2 seconds
          _timer = Timer(const Duration(seconds: 2), _resetTimerAndSnackBar);

          // Show a snackbar to inform the user
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Press back again to exit')),
          );

          // Don't exit the app yet
        }
      },
      child: const CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            flexibleSpace: CustomAppBar(),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeaturedBooksListView(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newest Books',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: NewestBooksListView(),
            ),
          )
        ],
      ),
    );
  }
}
