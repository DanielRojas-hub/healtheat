import 'package:category_repository/category_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Category>> streamCategories() {
    Query query = _firebaseFirestore.collection('categories');

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Category.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Stream<Category> streamCategory(String categoryId) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('categories').doc(categoryId);

    return reference.snapshots().map(
          (snapshot) => Category.fromSnapshot(snapshot),
        );
  }

  Future<Category> getCategory(String categoryId) async {
    final docSnap =
        await _firebaseFirestore.collection('categories').doc(categoryId).get();
    return Category.fromSnapshot(docSnap);
  }

  Future<List<Category>> getCategories() async {
    Query query = _firebaseFirestore.collection('categories');

    return (await query.get())
        .docs
        .map((doc) => Category.fromSnapshot(doc))
        .toList();
  }
}
