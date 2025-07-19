import 'package:flutter/material.dart';

class LoginCarousel extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final int numPages;
  final ValueChanged<int> onPageChanged;

  const LoginCarousel({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.numPages,
    required this.onPageChanged,
  });

  Widget _buildPageItem({required String image, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Image.asset(image, fit: BoxFit.contain)),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: [
              _buildPageItem(
                image: 'assets/images/budgetcalc.png',
                text: 'Track your expenses easily',
              ),
              _buildPageItem(
                image: 'assets/images/carousel1.png',
                text: 'Visualize your budget with charts',
              ),
              _buildPageItem(
                image: 'assets/images/carousel2.png',
                text: 'Set goals and stay on track',
              ),
              _buildPageItem(
                image: 'assets/images/carousel3.png',
                text: 'Get notified about your spending',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(numPages, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 14 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentPage == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
