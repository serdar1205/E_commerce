// import 'package:flutter/material.dart';
//
// class ProductDetailsModel extends StatelessWidget {
//   const ProductDetailsModel({
//     super.key,
//     required this.imageSlider,
//     required this.productData,
//     required this.bottomWidget,
//   });
//
//   final Widget imageSlider;
//   final Widget productData;
//   final Widget bottomWidget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:  AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.favorite_border)),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.81,
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   children: [
//                     imageSlider,
//                     productData
//                   ],
//                 ),
//               ),
//               bottomWidget,
//             ],
//           ),
//         ));
//   }
// }