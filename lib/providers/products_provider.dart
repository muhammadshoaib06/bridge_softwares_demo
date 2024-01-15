import 'package:bridge_softwares_demo/models/product_model.dart';
import 'package:bridge_softwares_demo/services/product_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_provider.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(true) bool isLoading,
    required ProductsModel productsModel,
  }) = _ProductState;

  const ProductState._();
}

class ProductNotifier extends StateNotifier<ProductState> {
  ProductNotifier()
      : super(
          ProductState(
            productsModel: ProductsModel(
              campaigns: Campaigns(
                imageTiles: [],
                promoBanners: [],
                sponsoredProducts: [],
              ),
              categoryName: '',
              diagnostics: Diagnostics(
                advertisementsEnabled: false,
                processingTime: 0,
                queryTime: 0,
                recommendationsEnabled: false,
                requestId: '',
                advertisementsAnalytics: AdvertisementsAnalytics(
                  customerOptIn: false,
                  items: [],
                  itemsFromPartner: [],
                  numberOfItemsFromPartner: 0,
                  placementBeacons: PlacementBeacons(
                    onLoadBeacon: '',
                    onViewBeacon: '',
                  ),
                  status: 0,
                ),
                recommendationsAnalytics: RecommendationsAnalytics(
                  items: [],
                  experimentTrackerkey: '',
                  numberOfItems: 0,
                  numberOfRecs: 0,
                  personalisationStatus: 0,
                  personalisationType: '',
                ),
              ),
              discoverSearchProductTypes: [],
              facets: [],
              itemCount: 0,
              products: [],
              queryId: '',
              redirectUrl: '',
              searchPassMeta: SearchPassMeta(
                alternateSearchTerms: [],
                isPartial: false,
                isSpellcheck: false,
                searchPass: [],
              ),
              searchTerm: '',
            ),
          ),
        ) {
    loadProduct();
  }

  /// Here The api response will be get and a state will be implemented against
  /// it response for the default api
  loadProduct() async {
    try {
      state = state.copyWith(isLoading: true);
      final productResponse = await ProductServices().fetchProduct();

      final products = ProductsModel.fromJson(productResponse);
      state = state.copyWith(productsModel: products, isLoading: false);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  /// Here The api response will be get and a state will be implemented against
  /// it response for the search api
  loadSearchedProduct(String productName) async {
    try {
      state = state.copyWith(isLoading: true);
      final productResponse =
          await ProductServices().fetchProductBySearching(productName);

      final products = ProductsModel.fromJson(productResponse);

      state = state.copyWith(productsModel: products, isLoading: false);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

final productProvider = StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(),
);
