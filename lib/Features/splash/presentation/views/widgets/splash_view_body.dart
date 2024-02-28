import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/Features/splash/presentation/views/widgets/fading_logo.dart';
import 'package:bookly/Features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      animationController,
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
      animationController,
    );
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadingLogo(fadeAnimation: fadeAnimation),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}
