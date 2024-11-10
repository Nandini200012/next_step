import 'package:connect_care/controller/splash_provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        if (splashProvider.isInitialized) {
          // Navigate to the home screen or main app after initialization
          Future.microtask(() {
            Navigator.pushReplacementNamed(context, '/signin');
          });
        }

        return Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
           color: Color.fromARGB(255, 53, 6, 128)
          ),
          child: Center(
            child: SizedBox(
              height: screenHeight * 0.15,
              width: screenWidth * 0.4,
              child: Image.asset(
                'assets/applogo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 10,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
