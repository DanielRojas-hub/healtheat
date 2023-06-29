import 'package:petition_repository/petition_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetitionRepository {
  final FirebaseFirestore _firebaseFirestore;

  PetitionRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // if (sortType == 0) {
  //   query = query.orderBy('rating');
  // } else if (sortType == 1) {
  //   query = query.orderBy('free');
  // } else {
  //   query = query.orderBy('working');
  // }

  Stream<Petition> streamPetition(String petitionId,
      {List<String>? selectedCategories}) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('petitions').doc(petitionId);

    return reference.snapshots().map(
          (snapshot) => Petition.fromSnapshot(snapshot),
        );
  }

  Future<Petition> getPetition(String petitionId, String orderId) async {
    final docSnap = await _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .collection('petitions')
        .doc(petitionId)
        .get();
    return Petition.fromSnapshot(docSnap);
  }

  Stream<List<Petition>> streamPetitions(String orderId,
      {List<String>? petitionIds}) {
    Query query = _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .collection('petitions');

    if (petitionIds != null && petitionIds.isNotEmpty) {
      query = query.where('id', whereIn: petitionIds);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Petition.fromMap(
                  (doc as QueryDocumentSnapshot<Map<String, dynamic>>).data()))
              .toList(),
        );
  }

  Future<List<Petition>> getPetitions(String orderId,
      {List<String>? petitionIds}) async {
    Query query = _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .collection('petitions');

    if (petitionIds != null && petitionIds.isNotEmpty) {
      query = query.where('id', whereIn: petitionIds);
    }

    return (await query.get())
        .docs
        .map((doc) => Petition.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> createPetition(Petition petition, String orderId) async {
    return await _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .collection('petitions')
        .doc(petition.id)
        .set(petition.toMap());
  }

  Future<void> updatePetition(
      {required String orderId,
      required String petitionId,
      required Map<String, dynamic> data}) async {
    return await _firebaseFirestore
        .collection('orders')
        .doc(orderId)
        .collection('petitions')
        .doc(petitionId)
        .update(data);
  }
}
