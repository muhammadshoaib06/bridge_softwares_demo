import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends ConsumerWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    return Expanded(
      child: Container(
        height: 56.sp,
        margin: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              floatingLabelStyle: TextStyle(),
            ),
          ),
          child: TextField(
            controller: searchController,
            onChanged: (value) {

              /// If the value is not empty
              /// then the value will send to the api for searching
              if (value.isNotEmpty) {
                ref.read(productProvider.notifier).loadSearchedProduct(value);
              } else {
                /// if empty then the default api will be hit.
                ref.read(productProvider.notifier).loadProduct();
              }
            },
            cursorColor: AppColors.primaryColor,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff717E95),
                ),
              ),
              filled: true,
              hintStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: const Color(0xff717E95),
                fontWeight: FontWeight.w400,
              ),
              hintText: 'Search',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
