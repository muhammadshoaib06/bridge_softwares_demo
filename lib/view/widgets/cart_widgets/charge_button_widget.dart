import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// A dummy Charge Button
class ChargeButtonWidget extends StatelessWidget {
  const ChargeButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            offset: const Offset(0, 25.0),
            blurRadius: 80.0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Charge: \$${HiveDatabase.cartSubTotal()}',
          style: GoogleFonts.poppins(
            fontSize: 15.0.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
