// import 'package:tehno_mir/data/models/products_model.dart';
//
// import '../../domain/entities/product.dart';
// import '../../domain/entities/search.dart';
//
// class SearchModel extends SearchEntity{
//   const SearchModel({required super.searchResults});
//
//   factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
//     searchResults: List<ProductsModel>.from(json["search_results"].map((x) => ProductsModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "search_results": List<ProductsModel>.from(searchResults.map((x) => x.toJson())),
//   };
//
//
// }