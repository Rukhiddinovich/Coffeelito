import 'package:coffeelito/data/firebase_service/order_service.dart';
import 'package:coffeelito/data/models/order/order_model.dart';
import 'package:coffeelito/data/models/universal_data.dart';

class OrderRepo{
  final OrderService orderService;
  OrderRepo({required this.orderService});

  Future<UniversalData> addOrder({required OrderModel orderModel})=>orderService.addOrder(orderModel: orderModel);
  Future<UniversalData> deleteOrder({required String orderId})=>orderService.deleteOrder(orderId: orderId,);
}