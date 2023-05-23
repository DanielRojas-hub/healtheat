import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Restaurant>> streamRestaurants(
      {List<String>? restaurantIds, List<String>? preferenceIds}) {
    Query query = _firebaseFirestore.collection('restaurants');

    if (preferenceIds != null && preferenceIds.isNotEmpty) {
      query = query.where('preferenceIds', arrayContainsAny: preferenceIds);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Restaurant.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Stream<Restaurant> streamRestaurant(String restaurantId,
      {List<String>? selectedCategories}) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('restaurants').doc(restaurantId);

    // var query;
    // if (selectedCategories != null && selectedCategories.isNotEmpty) {
    //   query = reference.where('categoryRestaurantIds',
    //       arrayContainsAny: selectedCategories);
    // } else {
    //   query = reference;
    // }

    return reference.snapshots().map(
          (snapshot) => Restaurant.fromSnapshot(snapshot),
        );
  }

  Future<Restaurant> getRestaurant(String restaurantId) async {
    final docSnap = await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .get();
    return Restaurant.fromSnapshot(docSnap);
  }

  Future<List<Restaurant>> getRestaurants(
      {List<String>? restaurantIds, List<String>? preferenceIds}) async {
    CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('restaurants');

    var query;
    if (restaurantIds != null && restaurantIds.isNotEmpty) {
      query = query.where('id', whereIn: restaurantIds);
    }
    if (preferenceIds != null && preferenceIds.isNotEmpty) {
      query = query.where('preferenceIds', arrayContainsAny: preferenceIds);
    }
    if (preferenceIds == null ||
        preferenceIds.isEmpty ||
        restaurantIds == null ||
        restaurantIds.isEmpty) {
      query = ref;
    }

    return query.get().docs.map((doc) => Restaurant.fromSnapshot(doc)).toList();
  }

  Future<void> createRestaurant(Restaurant restaurant) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurant.id)
        .set(restaurant.toMap());
  }

  Future<void> updateRestaurant(
      {required String restaurantId,
      required Map<String, dynamic> data}) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .update(data);
  }
}
