import 'package:cuisine_repository/cuisine_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CuisineRepository {
  final FirebaseFirestore _firebaseFirestore;

  CuisineRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Cuisine>> streamCuisines() {
    Query query = _firebaseFirestore.collection('cuisine');

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Cuisine.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Stream<Cuisine> streamCuisine(String cuisineId) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('cuisine').doc(cuisineId);

    return reference.snapshots().map(
          (snapshot) => Cuisine.fromSnapshot(snapshot),
        );
  }

  Future<Cuisine> getCuisine(String cuisineId) async {
    final docSnap =
        await _firebaseFirestore.collection('cuisine').doc(cuisineId).get();
    return Cuisine.fromSnapshot(docSnap);
  }

  Future<List<Cuisine>> getCuisines() async {
    Query query = _firebaseFirestore.collection('cuisine');

    return (await query.get())
        .docs
        .map((doc) => Cuisine.fromSnapshot(doc))
        .toList();
  }
}
