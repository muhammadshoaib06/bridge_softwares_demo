import 'package:bridge_softwares_demo/constants/api_constants.dart';
import 'package:dio/dio.dart';

class ProductServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      responseType: ResponseType.json,
      headers: {
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
        'X-RapidAPI-Key': '29398bc9c6msh57221f48fc2f08bp1fd7e8jsn1ac903c40b92'
      },
    ),
  );

  fetchProduct() async {
    var response = await _dio.get(
        '/products/v2/list?store=US&categoryId=4209&limit=10&country=US&lang=en-US&q=');

    return response.data;
  }

  fetchProductBySearching(String productName) async {
    var response = await _dio.get(
        '/products/v2/list?store=US&categoryId=4209&limit=10&country=US&lang=en-US&q=$productName');

    return response.data;
  }
}
