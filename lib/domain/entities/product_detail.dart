import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable{
  final int id;
  final String nameTm;
  final String nameEn;
  final String descTm;
  final String descEn;
  final int price;
  final String image;
  final String category;
  final int quantity;
  final int discount;
  final double salePrice;
  final List<ProductImage> images;

  const ProductDetailEntity({
    required this.id,
    required this.nameTm,
    required this.nameEn,
    required this.descTm,
    required this.descEn,
    required this.price,
    required this.image,
    required this.category,
    required this.quantity,
    required this.discount,
    required this.salePrice,
    required this.images,
  });

  @override
  List<Object> get props =>
      [
        id,
        nameTm,
        nameEn,
        descTm,
        descEn,
        price,
        image,
        category,
        quantity,
        discount,
        salePrice,
        images,
      ];
}
class ProductImage {
  final int id;
  final int product;
  final String image;

  ProductImage({
    required this.id,
    required this.product,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    id: json["id"],
    product: json["product"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product,
    "image": image,
  };
}
