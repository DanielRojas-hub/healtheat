import 'package:food_preference_repository/food_preference_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodPreferenceRepository {
  final FirebaseFirestore _firebaseFirestore;

  FoodPreferenceRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<FoodPreference> streamFoodPreference(
    String foodPreferenceId,
  ) {
    return _firebaseFirestore
        .collection('foodPreference')
        .doc(foodPreferenceId)
        .snapshots()
        .map(
          (snapshot) => FoodPreference.fromSnapshot(snapshot),
        );
  }

  Stream<List<FoodPreference>> streamFoodPreferences() {
    return _firebaseFirestore.collection('foodPreference').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => FoodPreference.fromMap(doc.data()))
              .toList(),
        );
  }

  Future<FoodPreference> getFoodPreference(String foodPreferenceId) async {
    final docSnap = await _firebaseFirestore
        .collection('foodPreference')
        .doc(foodPreferenceId)
        .get();
    return FoodPreference.fromSnapshot(docSnap);
  }

  Future<List<FoodPreference>> getFoodPreferences() async {
    return (await _firebaseFirestore.collection('foodPreference').get())
        .docs
        .map((doc) => FoodPreference.fromSnapshot(doc))
        .toList();
  }
}
