import 'package:flutter/material.dart';
import 'package:spence/pages/homepage.dart';
import 'package:spence/pages/login_carousel.dart';
import 'package:spence/services/authservices/googlesignin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 4;
 
  @override
  void initState() {
    super.initState();
    GoogleSignInService.initializeGoogleSignIn();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,

          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: 'Spence',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  children: const [
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF5CC7D),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your Budget, On Track',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              // Carousel and Login Button Centered
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 340,
                        child: LoginCarousel(
                          pageController: _pageController,
                          currentPage: _currentPage,
                          numPages: _numPages,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 52),
                      Container(
                        width: 340,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                255,
                                53,
                                53,
                                53,
                              ).withOpacity(0.15),
                              blurRadius: 9,
                              offset: Offset(1, 7),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton.icon(
                          icon: Image.asset(
                            'assets/images/googlelogo.png',
                            height: 30,
                          ),
                          label: const Text('Login with Google'),
                          onPressed: () async {
                            await GoogleSignInService.signIn();
                            final user = GoogleSignInService.currentUser;
                            print(user);
                            if (user != null) {
                              print('Signed in as: ${user.displayName}');
                              
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black87,
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14.0),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // _buildPageItem moved to LoginCarousel widget
}
