import 'package:user_preference_repository/user_preference_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserPreferenceRepository {
  final FirebaseFirestore _firebaseFirestore;

  UserPreferenceRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<UserPreference> streamUserPreference(
    String userId,
    String userPreferenceId,
  ) {
    DocumentReference<Map<String, dynamic>> reference = _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('userPreferences')
        .doc(userPreferenceId);

    return reference.snapshots().map(
          (snapshot) => UserPreference.fromSnapshot(snapshot),
        );
  }

  Stream<List<UserPreference>> streamUserPreferences(
    String userId,
  ) {
    Query query = _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('userPreferences');

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => UserPreference.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Future<UserPreference> getUserPreference(
      String userId, String userPreferenceId) async {
    final docSnap = await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('userPreferences')
        .doc(userPreferenceId)
        .get();
    return UserPreference.fromSnapshot(docSnap);
  }

  Future<List<UserPreference>> getUserPreferences(String userId) async {
    return (await _firebaseFirestore
            .collection('users')
            .doc(userId)
            .collection('userPreferences')
            .get())
        .docs
        .map((doc) => UserPreference.fromSnapshot(doc))
        .toList();
  }

  Future<void> createUserPreference(
      String userId, UserPreference userPreference) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('userPreferences')
        .doc(userPreference.id)
        .set(userPreference.toMap());
  }

  Future<void> updateUserPreference(
      String userId, String userPreferenceId, Map<String, dynamic> data) async {
    return await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('userPreferences')
        .doc(userPreferenceId)
        .update(data);
  }
}
