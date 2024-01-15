import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

/// A Loading widget when the waits for the api response
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      shrinkWrap: true,
      itemCount: 7,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1 / 1.8, crossAxisCount: 3),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.white.withOpacity(0.05),
          highlightColor: Colors.grey.withOpacity(0.2),
          direction: ShimmerDirection.ltr,
          child: Container(
            height: 200.sp,
            width: 200.sp,
            margin: EdgeInsets.only(right: 13.sp, top: 10.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0.sp),
              color: Colors.white,
              border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.3), width: 1.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
