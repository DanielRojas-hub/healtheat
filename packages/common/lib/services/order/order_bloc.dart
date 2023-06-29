import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({OrderRepository? orderRepository})
      : _orderRepository = orderRepository ?? OrderRepository(),
        super(OrderLoading()) {
    on<AddOrder>(_onAddOrder);
    on<StreamOrder>(_onStreamOrder);
    on<GetOrder>(_onGetOrder);
    on<StreamOrders>(_onStreamOrders);
    on<GetOrders>(_onGetOrders);
    on<UpdateOrder>(_onUpdateOrder);
    on<_OrderUpdated>(_onOrderUpdated);
    on<_OrdersUpdated>(_onOrdersUpdated);
  }

  final OrderRepository _orderRepository;

  StreamSubscription? _blocSubscription;
  StreamSubscription? _orderSubscription;

  @override
  Future<void> close() {
    _blocSubscription?.cancel();
    _orderSubscription?.cancel();
    return super.close();
  }

  Future<void> _onAddOrder(AddOrder event, Emitter<OrderState> emit) async {
    await _orderRepository.createOrder(event.order);
  }

  void _onStreamOrder(StreamOrder event, Emitter<OrderState> emit) {
    print('a');
    _orderSubscription?.cancel();
    try {
      _orderSubscription =
          _orderRepository.streamOrder(event.orderId).listen((order) {
        print('c');
        add(_OrderUpdated(order));
      });
    } catch (_) {
      //TODO: catch
    }
    print('b');
  }

  Future<void> _onGetOrder(GetOrder event, Emitter<OrderState> emit) async {
    _orderSubscription?.cancel();
    try {
      add(_OrderUpdated(await _orderRepository.getOrder(event.orderId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamOrders(StreamOrders event, Emitter<OrderState> emit) {
    _orderSubscription?.cancel();
    try {
      _orderSubscription = _orderRepository
          .streamOrders(
            orderIds: event.orderIds,
            restaurantId: event.restaurantId,
            userId: event.userId,
          )
          .listen((Orders) => add(_OrdersUpdated(Orders)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetOrders(GetOrders event, Emitter<OrderState> emit) async {
    _orderSubscription?.cancel();
    try {
      add(_OrdersUpdated(await _orderRepository.getOrders(
        orderIds: event.orderIds,
        restaurantId: event.restaurantId,
        userId: event.userId,
      )));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onOrderUpdated(_OrderUpdated event, Emitter<OrderState> emit) {
    return emit(OrderLoaded(event.order));
  }

  void _onUpdateOrder(UpdateOrder event, Emitter<OrderState> emit) {
    _orderRepository.updateOrder(orderId: event.orderId, data: event.data);
  }

  void _onOrdersUpdated(_OrdersUpdated event, Emitter<OrderState> emit) {
    return emit(OrdersLoaded(event.orders));
  }
}
