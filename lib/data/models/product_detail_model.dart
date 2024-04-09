import 'package:tehno_mir/domain/entities/product_detail.dart';

class ProductDetailModel extends ProductDetailEntity {
  const ProductDetailModel({
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
    required super.images,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"],
        nameTm: json["name_tm"],
        nameEn: json["name_en"],
        descTm: json["desc_tm"],
        descEn: json["desc_en"],
        price: json["price"],
        image: json["image"],
        category: json["category"],
        quantity: json["quantity"],
        discount: json["discount"],
        salePrice: json["sale_price"]?.toDouble(),
        images: List<ProductImage>.from(json["images"].map((x) => ProductImage.fromJson(x))),
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
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}
