import 'package:menu_repository/menu_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuRepository {
  final FirebaseFirestore _firebaseFirestore;

  MenuRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Menu>> streamMenus() {
    Query query = _firebaseFirestore.collection('menus');

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Menu.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Stream<Menu> streamMenu(String menuId) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('menus').doc(menuId);

    return reference.snapshots().map(
          (snapshot) => Menu.fromSnapshot(snapshot),
        );
  }

  Future<Menu> getMenu(String menuId) async {
    final docSnap =
        await _firebaseFirestore.collection('menus').doc(menuId).get();
    return Menu.fromSnapshot(docSnap);
  }

  Future<List<Menu>> getMenus() async {
    Query query = _firebaseFirestore.collection('menus');

    return (await query.get())
        .docs
        .map((doc) => Menu.fromSnapshot(doc))
        .toList();
  }
}
