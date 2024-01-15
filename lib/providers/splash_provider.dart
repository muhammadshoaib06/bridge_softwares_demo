import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashState {
  double containerWidth;
  double containerHeight;

  SplashState({required this.containerWidth, required this.containerHeight});
}

class SplashController extends StateNotifier<SplashState> {
  SplashController()
      : super(SplashState(containerWidth: 10.0, containerHeight: 10.0));

  void startAnimation() {
    Future.delayed(const Duration(milliseconds: 100), () {
      state.containerWidth = 1.sw;
      state.containerWidth = 1.sh;
    });
  }
}

final splashControllerProvider =
    StateNotifierProvider<SplashController, SplashState>(
  (ref) => SplashController(),
);
