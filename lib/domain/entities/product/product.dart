import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
 final int id;
 final String nameTm;
 final String nameEn;
 final String descTm;
 final  String descEn;
 final  int price;
 final  String? image;
 final  String category;
 final int quantity;
 final int discount;
 final double salePrice;

  const ProductEntity({
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
  });
 Map<String, dynamic> toJson() {
   return {
     "id": id,
     "nameTm": nameTm,
     "nameEn": nameEn,
     "descTm": descTm,
     "descEn": descEn,
     "price": price,
     "image": image,
     "category": category,
     "quantity": quantity,
     "discount": discount,
     "salePrice": salePrice,
   };
 }
  @override
  List<Object?> get props => [
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
      ];
}
