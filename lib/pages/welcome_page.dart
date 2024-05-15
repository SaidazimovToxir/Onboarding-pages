import 'package:flutter/material.dart';
import 'package:lesson_36/pages/onboarding.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  void _loadNextPage() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.bounceIn;
              dynamic tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              dynamic offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 300),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 350,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              // color: Colors.amber,
              decoration: BoxDecoration(
                // color: Colors.amber,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("images/logo.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
