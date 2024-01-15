import 'package:bridge_softwares_demo/constants/app_images.dart';
import 'package:bridge_softwares_demo/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double containerWidth = 10.sp;
  double containerHeight = 10.sp;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        containerWidth = 1.sw;
        containerHeight = 1.sh;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// Animate the App LOGO
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOut,
          width: containerWidth,
          height: containerHeight,
          onEnd: () {
            debugPrint('When animation ends!');

            /// After the animation ends it will redirect the user to the HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: SvgPicture.asset(
            AppImagesPath.logo,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
