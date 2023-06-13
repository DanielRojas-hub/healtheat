import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_repository/food_repository.dart';

class FoodRepository {
  FoodRepository({
    FirebaseFirestore? firebaseFirestore,
    FirebaseStorage? firebaseStorage,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  Stream<Food> streamFood(String restaurantId, String foodId) {
    return _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods')
        .doc(foodId)
        .snapshots()
        .map((snapshot) => Food.fromSnapshot(snapshot));
  }

  Future<Food> getFood(String restaurantId, String foodId) async {
    final docSnap = await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods')
        .doc(foodId)
        .get();
    return Food.fromSnapshot(docSnap);
  }

  Stream<List<Food>> streamFoods(String restaurantId, {List<String>? foodIds}) {
    Query query = _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods');

    if (foodIds != null && foodIds.isNotEmpty) {
      query = query.where('id', whereIn: foodIds);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Food.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Future<List<Food>> getFoods(String restaurantId,
      {List<String>? foodIds}) async {
    CollectionReference<Map<String, dynamic>> reference = _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods');

    var query;
    if (foodIds != null && foodIds.isNotEmpty) {
      query = reference.where('id', arrayContainsAny: foodIds);
    } else {
      query = reference;
    }

    return await query
        .get()
        .docs
        .map((doc) => Food.fromMap(doc.data()))
        .toList();
  }

  Future<void> createFood(String restaurantId, Food food) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods')
        .doc(food.id)
        .set(food.toMap());
  }

  Future<void> updateFood(
      {required String restaurantId,
      required String foodId,
      required Map<String, dynamic> data}) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods')
        .doc(foodId)
        .update(data);
  }

  Future<void> uploadFoodImage({String? filePath, String? fileName}) async {
    File file = File(filePath!);

    try {
      await _firebaseStorage.ref('food_image/$fileName').putFile(file);
    } catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String fileName) async {
    String downloadURL =
        await _firebaseStorage.ref('food_image/$fileName').getDownloadURL();
    print(downloadURL);
    return downloadURL;
  }
}
