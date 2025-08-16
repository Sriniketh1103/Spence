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
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(130, 5, 97, 28).withOpacity(0.05),
              ),
            ),
            SizedBox(
              height: 180,
              width: 180,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          _getDescription(text),
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  String _getDescription(String title) {
    switch (title) {
      case 'Track your expenses easily':
        return 'Effortlessly log every purchase and keep your spending organized.';
      case 'Visualize your budget with charts':
        return 'See your financial health at a glance with beautiful charts.';
      case 'Set goals and stay on track':
        return 'Set savings targets and monitor your progress over time.';
      case 'Get notified about your spending':
        return 'Receive timely alerts to help you avoid overspending.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
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
