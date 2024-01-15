import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/home/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartScreen(),
        ),
      ),
      child: ValueListenableBuilder(
        valueListenable: HiveDatabase.cartProductsBox.listenable(),
        builder: (context, box, _) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 17.sp),
            // margin: EdgeInsets.only(bottom: 10.sp),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.fromBorderSide(
                BorderSide(
                  color: AppColors.blackColor,
                ),
              ),
            ),
            height: 70.sp,
            child: Container(
              padding: EdgeInsets.only(
                left: 10.sp,
                right: 10.sp,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 40.sp,
                vertical: 10.sp,
              ),
              height: 50.0.sp,
              width: 100.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0.sp),
                color: AppColors.primaryColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${box.length} Items Added',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\$${HiveDatabase.cartSubTotal()}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
