import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Restaurant>> streamRestaurants(
      {List<String>? restaurantIds, List<String>? categoryRestaurantIds}) {
    final CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('restaurants');
    // var query;

    // if (restaurantIds != null && restaurantIds.isNotEmpty) {
    //   query = query.where('id', whereIn: restaurantIds);
    // }
    // if (categoryRestaurantIds != null && categoryRestaurantIds.isNotEmpty) {
    //   query = query.where('categoryRestaurantIds',
    //       arrayContainsAny: categoryRestaurantIds);
    // }
    // if (categoryRestaurantIds == null ||
    //     categoryRestaurantIds.isEmpty ||
    //     restaurantIds == null ||
    //     restaurantIds.isEmpty) {
    //   query = ref;
    // }

    return ref.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Restaurant.fromMap(doc.data()))
              .toList(),
        );
  }

  Stream<Restaurant> streamRestaurant(String restaurantId,
      {List<String>? selectedCategories}) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('restaurants').doc(restaurantId);

    /* var query;
    if (selectedCategories != null && selectedCategories.isNotEmpty) {
      query = reference.where('categoryRestaurantIds',
          arrayContainsAny: selectedCategories);
    } else {
      query = reference;
    } */

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
      {List<String>? restaurantIds,
      List<String>? categoryRestaurantIds}) async {
    CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('restaurants');

    var query;
    if (restaurantIds != null && restaurantIds.isNotEmpty) {
      query = query.where('id', whereIn: restaurantIds);
    }
    if (categoryRestaurantIds != null && categoryRestaurantIds.isNotEmpty) {
      query = query.where('categoryRestaurantIds',
          arrayContainsAny: categoryRestaurantIds);
    }
    if (categoryRestaurantIds == null ||
        categoryRestaurantIds.isEmpty ||
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
