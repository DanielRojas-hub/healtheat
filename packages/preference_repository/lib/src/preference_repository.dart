import 'package:preference_repository/preference_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  final FirebaseFirestore _firebaseFirestore;
  final Future<SharedPreferences> _prefs;

  PreferenceRepository({
    FirebaseFirestore? firebaseFirestore,
    Future<SharedPreferences>? prefs,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _prefs = prefs ?? SharedPreferences.getInstance();

  static const userPreferencesCacheKey = '__user_preferences_cache_key__';

  Future<List<Preference>> getUserPreferences() async {
    final SharedPreferences prefs = await _prefs;
    final userPreferenceJsons =
        prefs.getStringList(userPreferencesCacheKey) ?? [];
    final userPreferences = List.generate(userPreferenceJsons.length,
        (index) => Preference.fromJson(userPreferenceJsons[index]));
    return userPreferences;
  }

  Future<void> setUserPreferences(
      {required List<Preference> userPreferences}) async {
    final SharedPreferences prefs = await _prefs;
    final List<String> userPreferenceJsons = List.generate(
        userPreferences.length, (index) => userPreferences[index].toJson());
    await prefs.setStringList(userPreferencesCacheKey, userPreferenceJsons);
  }

  Stream<List<Preference>> streamPreferences({List<String>? preferenceIds}) {
    final CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('foodPreference');

    // var query;

    // if (restaurantIds != null && restaurantIds.isNotEmpty) {
    //   query = query.where('id', whereIn: restaurantIds);
    // }
    // if (categoryPreferenceIds != null && categoryPreferenceIds.isNotEmpty) {
    //   query = query.where('categoryPreferenceIds',
    //       arrayContainsAny: categoryPreferenceIds);
    // }
    // if (categoryPreferenceIds == null ||
    //     categoryPreferenceIds.isEmpty ||
    //     restaurantIds == null ||
    //     restaurantIds.isEmpty) {
    //   query = ref;
    // }

    return ref.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => Preference.fromMap(doc.data()))
              .toList(),
        );
  }

  Stream<Preference> streamPreference(
    String preferenceId,
  ) {
    DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.collection('foodPreference').doc(preferenceId);

    // var query;
    // if (selectedCategories != null && selectedCategories.isNotEmpty) {
    //   query = reference.where('categoryPreferenceIds',
    //       arrayContainsAny: selectedCategories);
    // } else {
    //   query = reference;
    // }

    return reference.snapshots().map(
          (snapshot) => Preference.fromSnapshot(snapshot),
        );
  }

  Future<Preference> getPreference(String preferenceId) async {
    final docSnap = await _firebaseFirestore
        .collection('foodPreference')
        .doc(preferenceId)
        .get();
    return Preference.fromSnapshot(docSnap);
  }

  Future<List<Preference>> getPreferences({List<String>? preferenceIds}) async {
    CollectionReference<Map<String, dynamic>> ref =
        _firebaseFirestore.collection('foodPreference');

    var query;
    if (preferenceIds != null && preferenceIds.isNotEmpty) {
      query = query.where('id', whereIn: preferenceIds);
    }
    if (preferenceIds == null || preferenceIds.isEmpty) {
      query = ref;
    }

    return query.get().docs.map((doc) => Preference.fromSnapshot(doc)).toList();
  }

  Future<void> createPreference(Preference preference) async {
    return await _firebaseFirestore
        .collection('foodPreference')
        .doc(preference.id)
        .set(preference.toMap());
  }

  Future<void> updatePreference(
      {required String preferenceId,
      required Map<String, dynamic> data}) async {
    return await _firebaseFirestore
        .collection('foodPreference')
        .doc(preferenceId)
        .update(data);
  }
}
