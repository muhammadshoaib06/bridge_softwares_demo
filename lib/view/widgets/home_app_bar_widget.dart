import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// HomeScreen Appbar widget
AppBar buildAppBar() => AppBar(
      backgroundColor: AppColors.primaryColor,
      leading:
          Icon(Icons.menu_rounded, color: AppColors.whiteColor, size: 25.sp),
      centerTitle: true,
      title: Text(
        'Store Products',
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
          letterSpacing: 1.8,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.sp),
          child: Icon(Icons.notifications_none_rounded,
              color: AppColors.whiteColor, size: 25.sp),
        ),
      ],
    );
