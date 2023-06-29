// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class StreamOrder extends OrderEvent {
  final String orderId;

  const StreamOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}

class GetOrder extends OrderEvent {
  final String orderId;

  const GetOrder(this.orderId);

  @override
  List<Object> get props => [orderId];
}

class StreamOrders extends OrderEvent {
  final List<String>? orderIds;
  final String? restaurantId;
  final String? userId;
  final int? state;
  final int? sortType;

  const StreamOrders(
      {this.orderIds,
      this.restaurantId,
      this.userId,
      this.state,
      this.sortType});

  @override
  List<Object?> get props => [orderIds, userId, restaurantId, state, sortType];
}

class GetOrders extends OrderEvent {
  final List<String>? orderIds;
  final String? restaurantId;
  final String? userId;
  final int? state;
  final int? sortType;
  const GetOrders(
      {this.orderIds,
      this.restaurantId,
      this.userId,
      this.state,
      this.sortType});

  @override
  List<Object?> get props => [orderIds, userId, restaurantId, state, sortType];
}

class UpdateOrder extends OrderEvent {
  final String orderId;
  final Map<String, dynamic> data;

  const UpdateOrder(this.orderId, this.data);

  @override
  List<Object> get props => [orderId, data];
}

class _OrderUpdated extends OrderEvent {
  final Order order;

  const _OrderUpdated(this.order);

  @override
  List<Object> get props => [order];
}

class _OrdersUpdated extends OrderEvent {
  final List<Order> orders;

  const _OrdersUpdated(this.orders);

  @override
  List<Object> get props => [orders];
}
