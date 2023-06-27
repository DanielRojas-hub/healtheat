import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_repository/order_repository.dart' as order;

class OrderRepository {
  final FirebaseFirestore _firebaseFirestore;

  OrderRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<order.Order> streamOrder(String orderId,
      {List<String>? selectedCategories}) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('orders').doc(orderId);

    return reference.snapshots().map(
          (snapshot) => order.Order.fromSnapshot(snapshot),
        );
  }

  Future<order.Order> getOrder(String orderId) async {
    final docSnap =
        await _firebaseFirestore.collection('orders').doc(orderId).get();
    return order.Order.fromSnapshot(docSnap);
  }

  Stream<List<order.Order>> streamOrders(
      {String? restaurantId, String? userId, List<String>? orderIds}) {
    Query query = _firebaseFirestore.collection('orders');

    if (restaurantId != null && restaurantId.isNotEmpty) {
      query = query.where('restaurantId', isEqualTo: restaurantId);
    }
    if (userId != null && userId.isNotEmpty) {
      query = query.where('userId', isEqualTo: userId);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => order.Order.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Future<List<order.Order>> getOrders(
      {String? restaurantId, String? userId, List<String>? orderIds}) async {
    Query query = _firebaseFirestore.collection('orders');

    if (restaurantId != null && restaurantId.isNotEmpty) {
      query = query.where('restaurantId', isEqualTo: restaurantId);
    }
    if (userId != null && userId.isNotEmpty) {
      query = query.where('userId', isEqualTo: userId);
    }

    return (await query.get())
        .docs
        .map((doc) => order.Order.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> createOrder(order.Order order) async {
    return await _firebaseFirestore
        .collection('orders')
        .doc(order.id)
        .set(order.toMap());
  }

  Future<void> updateOrder(
      {required String orderId, required Map<String, dynamic> data}) async {
    return await _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .update(data);
  }
}
