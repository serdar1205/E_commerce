import 'package:tehno_mir/domain/entities/product/product.dart';

class ProductsModel extends ProductEntity {
  const ProductsModel({
    required super.id,
    required super.nameTm,
    required super.nameEn,
    required super.descTm,
    required super.descEn,
    required super.price,
    required super.image,
    required super.category,
    required super.quantity,
    required super.discount,
    required super.salePrice,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      ProductsModel(
        id: json["id"],
        nameTm: json["name_tm"],
        nameEn: json["name_en"],
        descTm: json["desc_tm"],
        descEn: json["desc_en"],
        price: json["price"],
        image: json["image"] ?? '',
        category: json["category"],
        quantity: json["quantity"],
        discount: json["discount"],
        salePrice: json["sale_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_tm": nameTm,
        "name_en": nameEn,
        "desc_tm": descTm,
        "desc_en": descEn,
        "price": price,
        "image": image,
        "category": category,
        "quantity": quantity,
        "discount": discount,
        "sale_price": salePrice,
      };
}
