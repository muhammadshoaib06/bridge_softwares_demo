import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/constants/app_images.dart';
import 'package:bridge_softwares_demo/models/cart_product_model.dart';
import 'package:bridge_softwares_demo/models/product_model.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/home/cart/cart_screen.dart';
import 'package:bridge_softwares_demo/view/widgets/snackbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Product Detail Screen
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.whiteColor,
        ),
        centerTitle: true,
        title: Text(
          'Product Details',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
            letterSpacing: 1.8,
          ),
        ),
        actions: [
          /// A Cart Icon for navigation to the Cart Screen
          Padding(
            padding: EdgeInsets.only(right: 10.sp),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: AppColors.whiteColor,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 17.sp),
        physics: const BouncingScrollPhysics(),
        children: [
          /// Product Image
          SizedBox(
            height: 300.sp,
            width: 1.sw,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0.sp),
              child: Hero(
                tag: product.id,
                child: CachedNetworkImage(
                  imageUrl: 'https://${product.imageUrl}',
                  //'https://clipart-library.com/image_gallery2/Adidas-Shoes-Free-PNG-Image.png',
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return SvgPicture.asset(
                      AppImagesPath.productNoImage,
                      fit: BoxFit.scaleDown,
                      width: 200.sp,
                      height: 100.sp,
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20.sp),

          /// Product Name
          Text(
            product.name,
            style: GoogleFonts.poppins(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 10.sp),

          /// Product Brand & Product Currency Name
          Row(
            children: [
              /// Product Brand
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.brandName,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),

              /// Product Currency Name
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    product.price.currency.name,
                    style: GoogleFonts.poppins(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.sp),

          /// Select Color Text
          Text(
            'Select Color:',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          SizedBox(height: 5.sp),

          /// Select Color for the Product
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 100.sp,
              padding: EdgeInsets.symmetric(horizontal: 3.sp, vertical: 5.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0.sp),
                color: Colors.white,
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  width: 1.sp,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                /// Product Color
                child: Text(
                  product.colour,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20.sp),

          /// Price of the Product & Add to Cart Button
          Container(
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFD8DEEE)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              children: [
                /// Product Price
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Price\n',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: product.price.current.text,
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// Add to Cart Button
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        debugPrint('Add to cart.');

                        /// Here the Product will be added to the Local Database for Cart.
                        bool isAdded = HiveDatabase.cartProductsBox
                            .containsKey('key_${product.id}');
                        if (isAdded) {
                          showAppSnackBar(
                              context: context,
                              snackBarText: 'Product already Added!');
                        } else {
                          HiveDatabase.cartProductsBox.put(
                            'key_${product.id}',
                            CartProductModel(
                              id: product.id,
                              name: product.name,
                              price: product.price.current.value,
                              dateTime: DateTime.now(),
                            ),
                          );
                          showAppSnackBar(
                              context: context, snackBarText: 'Product Added!');
                          // setState(() {});
                        }
                      },
                      child: Container(
                        width: 100.sp,
                        height: 30.sp,
                        decoration: ShapeDecoration(
                          color: AppColors.primaryColor.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
