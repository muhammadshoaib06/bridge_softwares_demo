import 'package:bridge_softwares_demo/models/product_model.dart';
import 'package:bridge_softwares_demo/providers/products_provider.dart';
import 'package:bridge_softwares_demo/view/widgets/bottom_navigation_widget.dart';
import 'package:bridge_softwares_demo/view/widgets/home_app_bar_widget.dart';
import 'package:bridge_softwares_demo/view/widgets/loading_widget.dart';
import 'package:bridge_softwares_demo/view/widgets/product_card_widget.dart';
import 'package:bridge_softwares_demo/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductsModel products = ref.watch(productProvider).productsModel;
    bool isLoading = ref.watch(productProvider).isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: Column(
        children: [
          SizedBox(height: 10.sp),

          /// Search Product
          const SearchTextField(),
          SizedBox(height: 10.sp),

          /// Product List
          Expanded(
            flex: 14,
            child: isLoading
                ? const LoadingWidget()
                : GridView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 10.sp),
                    shrinkWrap: true,
                    itemCount: products.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.8, crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) =>
                        ProductCardWidget(
                      product: products.products[index],
                    ),
                  ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
