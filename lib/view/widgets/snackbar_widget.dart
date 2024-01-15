import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

showAppSnackBar({required BuildContext context, required String snackBarText}) {
  SnackBar snackBar = SnackBar(
    elevation: 5,
    showCloseIcon: true,
    margin: EdgeInsets.only(bottom: 10.sp, left: 17.sp, right: 17.sp),
    duration: const Duration(milliseconds: 2000),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    content: SizedBox(
      height: 20.sp,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          snackBarText,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    ),
  );

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
