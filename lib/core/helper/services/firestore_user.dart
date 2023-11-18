import 'package:abeero/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String userId) async {
    return await _userCollectionRef.doc(userId).get();
  }

  Future<bool> checkIfUserExists(String email) async {

    DocumentSnapshot document =
        await FirebaseFirestore.instance.collection('Users').doc("email").get();
    return document.exists;
  }
}
