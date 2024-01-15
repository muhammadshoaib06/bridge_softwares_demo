import 'package:bridge_softwares_demo/constants/app_colors.dart';
import 'package:bridge_softwares_demo/constants/app_images.dart';
import 'package:bridge_softwares_demo/models/cart_product_model.dart';
import 'package:bridge_softwares_demo/models/product_model.dart';
import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/home/product_detail_screen.dart';
import 'package:bridge_softwares_demo/view/widgets/snackbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          /// Product Image
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () {
                  debugPrint('Product Detail');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        product: widget.product,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0.sp),
                  child: SizedBox(
                    height: 120.sp,
                    width: 1.sw,
                    child: Hero(
                      tag: widget.product.id,
                      child: CachedNetworkImage(
                        imageUrl: 'https://${widget.product.imageUrl}',
                        fit: BoxFit.cover,
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
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.product.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                      fontSize: 12.0.sp,
                      color: AppColors.productNameColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                widget.product.price.current.text,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  color: AppColors.productPriceColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          /// Product Add to Cart Widget
          Expanded(
            child: InkWell(
              onTap: () {
                debugPrint('Add to cart.');
                bool isAdded = HiveDatabase.cartProductsBox
                    .containsKey('key_${widget.product.id}');
                if (isAdded) {
                  showAppSnackBar(
                      context: context, snackBarText: 'Product already Added!');
                } else {
                  HiveDatabase.cartProductsBox.put(
                    'key_${widget.product.id}',
                    CartProductModel(
                      id: widget.product.id,
                      name: widget.product.name,
                      price: widget.product.price.current.value,
                      dateTime: DateTime.now(),
                    ),
                  );
                  showAppSnackBar(
                      context: context, snackBarText: 'Product Added!');
                  setState(() {});
                }
              },
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.7),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text.rich(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Image.asset(
                            AppImagesPath.addToCartIcon,
                            fit: BoxFit.scaleDown,
                            height: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                          alignment: PlaceholderAlignment.middle,
                        ),
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: 'Add to Cart',
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
