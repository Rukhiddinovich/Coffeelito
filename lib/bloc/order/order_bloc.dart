import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeelito/data/models/order/order_model.dart';
import 'package:coffeelito/data/models/universal_data.dart';
import 'package:coffeelito/data/repositories/order_repo/order_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {

  OrderBloc({required this.orderRepository}) : super(OrderInitial()) {
    on<AddOrderEvent>(_addOrder);
    on<DeleteOrderEvent>(_deleteOrder);
    on<GetOrderEvent>(_listenOrders);
  }

  final OrderRepository orderRepository;
  List<OrderModel> userOrders=[];

  _addOrder(AddOrderEvent event,Emitter<OrderState> emit)async{
    emit(OrderLoadingState());
    UniversalData universalData  = await orderRepository.addOrder(orderModel: event.orderModel);
    if(universalData.error.isNotEmpty){
      emit(OrderErrorState(errorText: universalData.error));
    }
    if(universalData.error.isEmpty){
      emit(OrderAddSuccessState());
    }
    emit(OrderInitial());
  }

  _deleteOrder(DeleteOrderEvent event,Emitter<OrderState> emit)async{
    emit(OrderLoadingState());
    UniversalData universalData = await orderRepository.deleteOrder(orderId: event.orderId);
    if(universalData.error.isNotEmpty){
      emit(OrderErrorState(errorText: universalData.error));
    }
    if(universalData.error.isEmpty){
      emit(OrderDeleteSuccessState());
    }
    emit(OrderInitial());
  }

  Stream<List<OrderModel>> listenOrdersList(String? userId) async* {
    if (userId == null) {
      yield* FirebaseFirestore.instance.collection("orders").snapshots().map(
            (event1) => event1.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
    } else {
      yield* FirebaseFirestore.instance
          .collection("orders")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map(
            (event1) => event1.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList(),
      );
    }
  }


  _listenOrders(GetOrderEvent event,Emitter<OrderState> emit) async {
    listenOrdersList(event.userId).listen((List<OrderModel> orders) {
      userOrders = orders;
      debugPrint("CURRENT USER ORDERS LENGTH:${userOrders.length}");
      emit(OrderUpdateState());
      emit(OrderInitial());
    });
  }
}
