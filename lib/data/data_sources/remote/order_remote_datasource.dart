import 'dart:convert';

import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/order/order_model.dart';
import 'package:tehno_mir/data/models/order/order_preview_model.dart';
import 'package:tehno_mir/domain/entities/order/order.dart';
import 'package:tehno_mir/domain/entities/order/order_preview.dart';
import 'package:tehno_mir/domain/usecases/order/order_product.dart';

abstract class OrderRemoteDataSource {
  Future<OrderEntity> orderProduct(OrderProductParams params);

  Future<List<OrderEntity>> getOrderedHistory();

  Future<OrderPreviewEntity> getOrderPreview();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final ApiProvider apiProvider;

  OrderRemoteDataSourceImpl(this.apiProvider);

  @override
  Future<OrderPreviewEntity> getOrderPreview() async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.orderPreview);
    if (response.statusCode == 200) {
      return OrderPreviewModel.fromJson(response.data);
    } else {
      throw '';
    }
  }

  @override
  Future<List<OrderEntity>> getOrderedHistory() async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.order);
    if (response.statusCode == 200) {
      //print(response.data);
      final responseData = response.data as List;
      print(responseData);
      return responseData.map((e) => OrderModel.fromJson(e)).toList();
    } else {
      throw '';
    }
  }

  @override
  Future<OrderEntity> orderProduct(OrderProductParams params) async {
    final response =
        await apiProvider.post(endPoint: ApiEndpoints.order, data: {
      'payment_type': params.paymentType,
      'product_price': params.productPrice,
      'delivery_fee': params.deliveryFee,
      'discount': params.discount,
      'total_amount': params.totalAmount,
      'address': params.address,
    });
    if (response.statusCode == 201) {
      print('Ordered');
      print(response.data);
      return OrderModel.fromJson(response.data);
    } else {
      throw '';
    }
  }
}
