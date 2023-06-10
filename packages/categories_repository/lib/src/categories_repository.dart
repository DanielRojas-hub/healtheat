import 'package:categories_repository/categories_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoriesRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Categories>> streamCategories() {
    Query query = _firebaseFirestore.collection('categories');

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Categories.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Stream<Categories> streamCategory(String categoriesId) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('categories').doc(categoriesId);

    return reference.snapshots().map(
          (snapshot) => Categories.fromSnapshot(snapshot),
        );
  }

  Future<Categories> getCategory(String categoriesId) async {
    final docSnap = await _firebaseFirestore
        .collection('categories')
        .doc(categoriesId)
        .get();
    return Categories.fromSnapshot(docSnap);
  }

  Future<List<Categories>> getCategories() async {
    Query query = _firebaseFirestore.collection('categories');

    return (await query.get())
        .docs
        .map((doc) => Categories.fromSnapshot(doc))
        .toList();
  }
}
