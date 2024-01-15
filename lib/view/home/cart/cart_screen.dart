import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/models/cart_product_model.dart';
import 'package:bridge_softwares_demo/view/widgets/cart_widgets/charge_button_widget.dart';
import 'package:bridge_softwares_demo/view/widgets/cart_widgets/delete_single_product_dialog.dart';
import 'package:bridge_softwares_demo/view/widgets/cart_widgets/empty_cart_dialog.dart';
import 'package:bridge_softwares_demo/view/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveDatabase.cartProductsBox.listenable(),
      builder: (context, box, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.whiteColor,
          ),
          centerTitle: true,
          title: Text(
            'Cart Screen',
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
              letterSpacing: 1.8,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 20.sp),
          children: [
            SizedBox(height: 20.sp),

            /// Cart Products List
            ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: box.length,
              itemBuilder: (context, index) {
                CartProductModel? cartItem =
                    HiveDatabase.cartProductsBox.getAt(index);
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 70.sp,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.red,
                        border: Border.all(
                          color: const Color(0xFFD8DEEE),
                        ),
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ),
                  confirmDismiss: (DismissDirection direction) async {
                    return await showSingleDeleteCartProductDialog(
                        context, cartItem.id);
                  },
                  // onDismissed: (DismissDirection direction) {
                  //   HiveDatabase.cartProductsBox.deleteAt(index);
                  //   showAppSnackBar(
                  //     context: context,
                  //     snackBarText: 'Product removed from Cart!',
                  //   );
                  // },
                  key: ValueKey<int>(cartItem!.id),
                  child: Container(
                    height: 70.sp,
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.sp, vertical: 10.sp),
                    margin: EdgeInsets.only(bottom: 15.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColors.whiteColor,
                      border: Border.all(
                        color: const Color(0xFFD8DEEE),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          offset: const Offset(0, 25.0),
                          blurRadius: 80.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 34.sp,
                            height: 34.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0.sp),
                                color: AppColors.primaryColor.withOpacity(0.1)),
                            child: Center(
                              child: Text(
                                '1',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.sp),
                        Expanded(
                          flex: 5,
                          child: Text(
                            cartItem.name,
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                              fontSize: 16.0.sp,
                              color: const Color(0xFF363A60),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '\$${cartItem.price}',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.fromBorderSide(
              BorderSide(
                color: AppColors.blackColor,
              ),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 10.sp),
            children: [
              /// Discount Text
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Discount:',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0.sp,
                          color: const Color(0xFF363A60),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\$00.00',
                        style: GoogleFonts.poppins(
                          fontSize: 12.0.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// Subtotal Text
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Subtotal:',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0.sp,
                          color: const Color(0xFF363A60),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '\$${HiveDatabase.cartSubTotal()}',
                        style: GoogleFonts.poppins(
                          fontSize: 14.0.sp,
                          color: const Color(0xFF363A60),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Divider(
                height: 30.sp,
                color: Colors.grey,
                thickness: 0.5,
              ),

              /// Empty Card Widget
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    if (HiveDatabase.cartProductsBox.isEmpty) {
                      showAppSnackBar(
                        context: context,
                        snackBarText: 'Cart is already clear.',
                      );
                    } else {
                      showDeleteCartProductsDialog(context, 0);
                    }

                    // setState(() {});
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    TextSpan(
                      children: [
                        WidgetSpan(
                            child: Icon(Icons.delete_outline_rounded,
                                color: Colors.red, size: 22.sp),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                          text: 'Empty Cart',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.sp),

              /// Check out button
              const ChargeButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
