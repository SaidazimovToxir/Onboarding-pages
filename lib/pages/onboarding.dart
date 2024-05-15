import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_36/pages/register/chooice_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  PageController _controller = PageController();
  List imagesList = [
    "https://img.freepik.com/free-photo/handshake-icon-concept-partnership-agreement_107791-16725.jpg?t=st=1715767046~exp=1715770646~hmac=0150d22d1a56524c11c309842f1d222fb6fff468f931722fc52dee4445042850&w=1060",
    "https://i.stack.imgur.com/4CeqZ.png",
    "https://www.codewithrandom.com/wp-content/uploads/2023/07/date-1.png",
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Gap(60),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: imagesList.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Container(
                  child: Image.network(
                    imagesList[i],
                  ),
                );
              },
            ),
          ),
          const Gap(20),

          /// [Dots -> Scrool dots]
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => buildDot(index, context),
            ),
          ),
          Gap(100),
          const Text(
            "Set Your Schedules",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: Text(
              "occaecat quis. Cillum nisi officia ea laborum consectetur magna reprehenderit incididunt.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),

          /// [Buttons -> Next and Continue]
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff4155FA),
                  Color.fromARGB(255, 87, 95, 171),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 71, 83, 149).withOpacity(0.6),
                  offset: const Offset(3.0, 4.0),
                  blurRadius: 12.0,
                  spreadRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 40.0,
              bottom: 80.0,
            ),
            child: TextButton(
              onPressed: () {
                if (_currentIndex == imagesList.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooicePage(),
                    ),
                  );
                }

                _controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                );
              },
              child: Text(
                _currentIndex == imagesList.length - 1 ? "Continue" : "Next",
                style: const TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: _currentIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? const Color(0xff4155FA)
            : const Color.fromARGB(255, 228, 234, 234),
        borderRadius: _currentIndex == index
            ? BorderRadius.circular(50)
            : BorderRadius.circular(100),
      ),
      child: AnimatedOpacity(
        opacity: _currentIndex == index ? 1.0 : 0.5,
        duration: const Duration(
          milliseconds: 300,
        ),
      ),
    );
  }
}
