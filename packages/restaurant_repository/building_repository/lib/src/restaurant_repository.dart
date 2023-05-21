import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Restaurant>> streamRestaurants({List<String>? restaurantIds}) {
    final CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('restaurants');
    final Query<Map<String, dynamic>> query;

    if (restaurantIds != null && restaurantIds.isNotEmpty) {
      query = ref.where('id', whereIn: restaurantIds);
    } else {
      query = ref;
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Restaurant.fromMap(doc.data()))
              .toList(),
        );
  }

  Stream<List<Restaurant>> streamUserRestaurants(List<String>? restaurantIds) {
    return _firebaseFirestore
        .collection('restaurants')
        .where('id', whereIn: restaurantIds)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Restaurant.fromMap(doc.data()))
              .toList(),
        );
  }

  Stream<Restaurant> streamRestaurant(String restaurantId) {
    return _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .snapshots()
        .map(
          (snapshot) => Restaurant.fromSnapshot(snapshot),
        );
  }

  Stream<List<Restaurant>> getRestaurantsByCategories(
      List<String?> selectedCategories) {
    CollectionReference restaurantsCollection =
        FirebaseFirestore.instance.collection('restaurants');
    Query<Object?> query = restaurantsCollection.where('');
    if (selectedCategories.isNotEmpty) {
      query = query.where('categories', arrayContainsAny: selectedCategories);
    }
    return query.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Restaurant.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> createRestaurant(Restaurant restaurant) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurant.id)
        .set(restaurant.toMap());
  }
}
