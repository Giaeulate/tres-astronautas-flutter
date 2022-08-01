import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.expiredDate,
  });

  String id;
  String name;
  double price;
  DateTime? expiredDate;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        name: json["name"],
        price: double.parse(json["price"].toString()),
        expiredDate: json["expired_date"] != null
            ? DateTime.parse(json["expired_date"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price.toString(),
        "expired_date": expiredDate != null
            ? "${expiredDate!.year.toString().padLeft(4, '0')}-${expiredDate!.month.toString().padLeft(2, '0')}-${expiredDate!.day.toString().padLeft(2, '0')}"
            : null,
      };
}
