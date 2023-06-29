import 'package:user_repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<User> streamUser(String userId) {
    return _firebaseFirestore.collection('users').doc(userId).snapshots().map(
          (snapshot) => User.fromSnapshot(snapshot),
        );
  }

  Future<void> createUser(User user) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(user.toMap());
  }

  Future<void> updateUser(User user, Map<String, dynamic> data) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .update(data);
  }

  Future<void> deleteUser(User user) async {
    return await _firebaseFirestore
        .collection("users")
        .doc(user.id)
        .update(<String, dynamic>{
      'deleted': true,
    });
  }
}
