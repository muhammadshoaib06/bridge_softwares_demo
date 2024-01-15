// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

class ProductsModel {
  final String searchTerm;
  final String categoryName;
  final int itemCount;
  final String redirectUrl;
  final List<Product> products;
  final List<Facet> facets;
  final Diagnostics diagnostics;
  final SearchPassMeta searchPassMeta;
  final dynamic queryId;
  final List<dynamic> discoverSearchProductTypes;
  final Campaigns campaigns;

  ProductsModel({
    required this.searchTerm,
    required this.categoryName,
    required this.itemCount,
    required this.redirectUrl,
    required this.products,
    required this.facets,
    required this.diagnostics,
    required this.searchPassMeta,
    required this.queryId,
    required this.discoverSearchProductTypes,
    required this.campaigns,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        searchTerm: json["searchTerm"],
        categoryName: json["categoryName"] ?? '',
        itemCount: json["itemCount"],
        redirectUrl: json["redirectUrl"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        facets: List<Facet>.from(json["facets"].map((x) => Facet.fromJson(x))),
        diagnostics: Diagnostics.fromJson(json["diagnostics"]),
        searchPassMeta: SearchPassMeta.fromJson(json["searchPassMeta"]),
        queryId: json["queryId"],
        discoverSearchProductTypes: List<dynamic>.from(
            json["discoverSearchProductTypes"].map((x) => x)),
        campaigns: Campaigns.fromJson(json["campaigns"]),
      );
}

class Campaigns {
  final List<dynamic> imageTiles;
  final List<dynamic> promoBanners;
  final List<dynamic> sponsoredProducts;

  Campaigns({
    required this.imageTiles,
    required this.promoBanners,
    required this.sponsoredProducts,
  });

  factory Campaigns.fromJson(Map<String, dynamic> json) => Campaigns(
        imageTiles: List<dynamic>.from(json["imageTiles"].map((x) => x)),
        promoBanners: List<dynamic>.from(json["promoBanners"].map((x) => x)),
        sponsoredProducts:
            List<dynamic>.from(json["sponsoredProducts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "imageTiles": List<dynamic>.from(imageTiles.map((x) => x)),
        "promoBanners": List<dynamic>.from(promoBanners.map((x) => x)),
        "sponsoredProducts":
            List<dynamic>.from(sponsoredProducts.map((x) => x)),
      };
}

class Diagnostics {
  final String requestId;
  final int processingTime;
  final int queryTime;
  final bool recommendationsEnabled;
  final RecommendationsAnalytics recommendationsAnalytics;
  final bool advertisementsEnabled;
  final AdvertisementsAnalytics advertisementsAnalytics;

  Diagnostics({
    required this.requestId,
    required this.processingTime,
    required this.queryTime,
    required this.recommendationsEnabled,
    required this.recommendationsAnalytics,
    required this.advertisementsEnabled,
    required this.advertisementsAnalytics,
  });

  factory Diagnostics.fromJson(Map<String, dynamic> json) => Diagnostics(
        requestId: json["requestId"],
        processingTime: json["processingTime"],
        queryTime: json["queryTime"],
        recommendationsEnabled: json["recommendationsEnabled"],
        recommendationsAnalytics:
            RecommendationsAnalytics.fromJson(json["recommendationsAnalytics"]),
        advertisementsEnabled: json["advertisementsEnabled"],
        advertisementsAnalytics:
            AdvertisementsAnalytics.fromJson(json["advertisementsAnalytics"]),
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "processingTime": processingTime,
        "queryTime": queryTime,
        "recommendationsEnabled": recommendationsEnabled,
        "recommendationsAnalytics": recommendationsAnalytics.toJson(),
        "advertisementsEnabled": advertisementsEnabled,
        "advertisementsAnalytics": advertisementsAnalytics.toJson(),
      };
}

class AdvertisementsAnalytics {
  final int status;
  final bool customerOptIn;
  final int numberOfItemsFromPartner;
  final List<dynamic> items;
  final List<dynamic> itemsFromPartner;
  final PlacementBeacons placementBeacons;

  AdvertisementsAnalytics({
    required this.status,
    required this.customerOptIn,
    required this.numberOfItemsFromPartner,
    required this.items,
    required this.itemsFromPartner,
    required this.placementBeacons,
  });

  factory AdvertisementsAnalytics.fromJson(Map<String, dynamic> json) =>
      AdvertisementsAnalytics(
        status: json["status"],
        customerOptIn: json["customerOptIn"],
        numberOfItemsFromPartner: json["numberOfItemsFromPartner"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
        itemsFromPartner:
            List<dynamic>.from(json["itemsFromPartner"].map((x) => x)),
        placementBeacons: PlacementBeacons.fromJson(json["placementBeacons"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "customerOptIn": customerOptIn,
        "numberOfItemsFromPartner": numberOfItemsFromPartner,
        "items": List<dynamic>.from(items.map((x) => x)),
        "itemsFromPartner": List<dynamic>.from(itemsFromPartner.map((x) => x)),
        "placementBeacons": placementBeacons.toJson(),
      };
}

class PlacementBeacons {
  final dynamic onLoadBeacon;
  final dynamic onViewBeacon;

  PlacementBeacons({
    required this.onLoadBeacon,
    required this.onViewBeacon,
  });

  factory PlacementBeacons.fromJson(Map<String, dynamic> json) =>
      PlacementBeacons(
        onLoadBeacon: json["onLoadBeacon"],
        onViewBeacon: json["onViewBeacon"],
      );

  Map<String, dynamic> toJson() => {
        "onLoadBeacon": onLoadBeacon,
        "onViewBeacon": onViewBeacon,
      };
}

class RecommendationsAnalytics {
  final int personalisationStatus;
  final int numberOfItems;
  final int numberOfRecs;
  final String personalisationType;
  final String experimentTrackerkey;
  final List<dynamic> items;

  RecommendationsAnalytics({
    required this.personalisationStatus,
    required this.numberOfItems,
    required this.numberOfRecs,
    required this.personalisationType,
    required this.experimentTrackerkey,
    required this.items,
  });

  factory RecommendationsAnalytics.fromJson(Map<String, dynamic> json) =>
      RecommendationsAnalytics(
        personalisationStatus: json["personalisationStatus"],
        numberOfItems: json["numberOfItems"],
        numberOfRecs: json["numberOfRecs"],
        personalisationType: json["personalisationType"],
        experimentTrackerkey: json["experimentTrackerkey"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "personalisationStatus": personalisationStatus,
        "numberOfItems": numberOfItems,
        "numberOfRecs": numberOfRecs,
        "personalisationType": personalisationType,
        "experimentTrackerkey": experimentTrackerkey,
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}

class Facet {
  final String id;
  final String name;
  final List<FacetValue> facetValues;
  final DisplayStyle displayStyle;
  final FacetType facetType;
  final bool hasSelectedValues;

  Facet({
    required this.id,
    required this.name,
    required this.facetValues,
    required this.displayStyle,
    required this.facetType,
    required this.hasSelectedValues,
  });

  factory Facet.fromJson(Map<String, dynamic> json) => Facet(
        id: json["id"],
        name: json["name"],
        facetValues: List<FacetValue>.from(
            json["facetValues"].map((x) => FacetValue.fromJson(x))),
        displayStyle: displayStyleValues.map[json["displayStyle"]]!,
        facetType: facetTypeValues.map[json["facetType"]]!,
        hasSelectedValues: json["hasSelectedValues"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "facetValues": List<dynamic>.from(facetValues.map((x) => x.toJson())),
        "displayStyle": displayStyleValues.reverse[displayStyle],
        "facetType": facetTypeValues.reverse[facetType],
        "hasSelectedValues": hasSelectedValues,
      };
}

enum DisplayStyle { PRICE_SLIDER, SINGLE_COLUMN }

final displayStyleValues = EnumValues({
  "Price-Slider": DisplayStyle.PRICE_SLIDER,
  "Single-Column": DisplayStyle.SINGLE_COLUMN
});

enum FacetType { RANGE, TEXT_MULTI_SELECT }

final facetTypeValues = EnumValues(
    {"Range": FacetType.RANGE, "TextMultiSelect": FacetType.TEXT_MULTI_SELECT});

class FacetValue {
  final int count;
  final String id;
  final String name;
  final bool isSelected;

  FacetValue({
    required this.count,
    required this.id,
    required this.name,
    required this.isSelected,
  });

  factory FacetValue.fromJson(Map<String, dynamic> json) => FacetValue(
        count: json["count"],
        id: json["id"],
        name: json["name"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "id": id,
        "name": name,
        "isSelected": isSelected,
      };
}

class Product {
  final int id;
  final String name;
  final Price price;
  final String colour;
  final int colourWayId;
  final String brandName;
  final bool hasVariantColours;
  final bool hasMultiplePrices;
  final dynamic groupId;
  final int productCode;
  final String productType;
  final String url;
  final String imageUrl;
  final List<String> additionalImageUrls;
  final dynamic videoUrl;
  final bool showVideo;
  final bool isSellingFast;
  final dynamic sponsoredCampaignId;
  final List<dynamic> facetGroupings;
  final dynamic advertisement;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.colour,
    required this.colourWayId,
    required this.brandName,
    required this.hasVariantColours,
    required this.hasMultiplePrices,
    required this.groupId,
    required this.productCode,
    required this.productType,
    required this.url,
    required this.imageUrl,
    required this.additionalImageUrls,
    required this.videoUrl,
    required this.showVideo,
    required this.isSellingFast,
    required this.sponsoredCampaignId,
    required this.facetGroupings,
    required this.advertisement,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: Price.fromJson(json["price"]),
        colour: json["colour"],
        colourWayId: json["colourWayId"],
        brandName: json["brandName"],
        hasVariantColours: json["hasVariantColours"],
        hasMultiplePrices: json["hasMultiplePrices"],
        groupId: json["groupId"],
        productCode: json["productCode"],
        productType: json["productType"] ?? '',
        url: json["url"],
        imageUrl: json["imageUrl"],
        additionalImageUrls:
            List<String>.from(json["additionalImageUrls"].map((x) => x)),
        videoUrl: json["videoUrl"],
        showVideo: json["showVideo"],
        isSellingFast: json["isSellingFast"],
        sponsoredCampaignId: json["sponsoredCampaignId"],
        facetGroupings:
            List<dynamic>.from(json["facetGroupings"].map((x) => x)),
        advertisement: json["advertisement"],
      );
}

class Price {
  final Current current;
  final Current previous;
  final Current rrp;
  final bool isMarkedDown;
  final bool isOutletPrice;
  final Currency currency;

  Price({
    required this.current,
    required this.previous,
    required this.rrp,
    required this.isMarkedDown,
    required this.isOutletPrice,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: Current.fromJson(json["current"]),
        previous: Current.fromJson(json["previous"]),
        rrp: Current.fromJson(json["rrp"]),
        isMarkedDown: json["isMarkedDown"],
        isOutletPrice: json["isOutletPrice"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
        "previous": previous.toJson(),
        "rrp": rrp.toJson(),
        "isMarkedDown": isMarkedDown,
        "isOutletPrice": isOutletPrice,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

class Current {
  final double value;
  final String text;

  Current({
    required this.value,
    required this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"]?.toDouble() ?? 0.0,
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}

//enum ProductType { PRODUCT }

//final productTypeValues = EnumValues({"Product": ProductType.PRODUCT});

class SearchPassMeta {
  final bool isPartial;
  final bool isSpellcheck;
  final List<dynamic> searchPass;
  final List<dynamic> alternateSearchTerms;

  SearchPassMeta({
    required this.isPartial,
    required this.isSpellcheck,
    required this.searchPass,
    required this.alternateSearchTerms,
  });

  factory SearchPassMeta.fromJson(Map<String, dynamic> json) => SearchPassMeta(
        isPartial: json["isPartial"],
        isSpellcheck: json["isSpellcheck"],
        searchPass: List<dynamic>.from(json["searchPass"].map((x) => x)),
        alternateSearchTerms:
            List<dynamic>.from(json["alternateSearchTerms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isPartial": isPartial,
        "isSpellcheck": isSpellcheck,
        "searchPass": List<dynamic>.from(searchPass.map((x) => x)),
        "alternateSearchTerms":
            List<dynamic>.from(alternateSearchTerms.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
