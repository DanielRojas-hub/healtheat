import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Restaurant>> streamRestaurants(
      {List<String>? restaurantIds,
      List<String>? preferenceIds,
      List<String>? categoryIds,
      List<String>? cuisineIds,
      List<String>? menuIds,
      int? sortType}) {
    Query query = _firebaseFirestore.collection('restaurants');

    if (preferenceIds != null && preferenceIds.isNotEmpty) {
      query = query.where('preferenceIds', arrayContainsAny: preferenceIds);
    }
    if (categoryIds != null && categoryIds.isNotEmpty) {
      query = query.where('categoryIds', arrayContainsAny: categoryIds);
    }
    if (cuisineIds != null && cuisineIds.isNotEmpty) {
      query = query.where('cuisineIds', arrayContainsAny: cuisineIds);
    }
    if (menuIds != null && menuIds.isNotEmpty) {
      query = query.where('menuIds', arrayContainsAny: menuIds);
    }

    if (sortType == 0) {
      query = query.orderBy('rating');
    } else if (sortType == 1) {
      query = query.orderBy('free');
    } else {
      query = query.orderBy('working');
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
      {List<String>? restaurantIds,
      List<String>? preferenceIds,
      List<String>? categoryIds,
      List<String>? cuisineIds,
      List<String>? menuIds,
      int? sortType}) async {
    Query query = _firebaseFirestore.collection('restaurants');

    if (preferenceIds != null && preferenceIds.isNotEmpty) {
      query = query.where('preferenceIds', arrayContainsAny: preferenceIds);
    }
    if (categoryIds != null && categoryIds.isNotEmpty) {
      query = query.where('categoryIds', arrayContainsAny: categoryIds);
    }
    if (cuisineIds != null && cuisineIds.isNotEmpty) {
      query = query.where('cuisineIds', arrayContainsAny: cuisineIds);
    }
    if (menuIds != null && menuIds.isNotEmpty) {
      query = query.where('menuIds', arrayContainsAny: menuIds);
    }

    if (sortType == 0) {
      query = query.orderBy('rating');
    } else if (sortType == 1) {
      query = query.orderBy('free');
    } else {
      query = query.orderBy('working');
    }

    return (await query.get())
        .docs
        .map((doc) => Restaurant.fromSnapshot(doc))
        .toList();
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
