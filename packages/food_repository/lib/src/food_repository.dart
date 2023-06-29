import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_repository/food_repository.dart';
import 'package:path/path.dart';

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
    Query query = _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods');

    if (foodIds != null && foodIds.isNotEmpty) {
      query = query.where('id', whereIn: foodIds);
    }

    return (await query.get())
        .docs
        .map((doc) => Food.fromMap(doc.data() as Map<String, dynamic>))
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

  Future uploadFoodImage(File file) async {
    final ref = _firebaseStorage.ref().child('food_image');
    final fileName = basename(file.path);
    final uploadTask = ref.child(fileName).putFile(file);
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> deleteFood(String restaurantId, String foodId) async {
    return await _firebaseFirestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('foods')
        .doc(foodId)
        .delete();
  }
}
