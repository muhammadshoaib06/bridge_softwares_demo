import 'package:hive/hive.dart';

part 'cart_product_model.g.dart';

/// Cart Product Model
@HiveType(typeId: 1)
class CartProductModel {
  CartProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.dateTime,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  DateTime dateTime;
}
