import 'package:abeero/core/constants.dart';
import 'package:abeero/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/services/firestore_user.dart';
import '../features/userlayout/layout_screen.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin(debug: true);
  String? email, password, name;
  bool isLoading = false;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

    await _auth.signInWithCredential(credential).then((user) {
      saveUserData(user);
      Get.offAll(LayoutScreen());
    });
  }

  void facebookSignInMethod() async {
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

    FacebookLoginResult result = await _facebookLogin.logIn();
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

    final accessToken = result.accessToken?.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken!);
      await _auth.signInWithCredential(faceCredential);
      print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    }
  }

  void signInWithEmailAndPassword() async {
    isLoading = true;
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        isLoading = false;
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

        print(value);
        Get.offAll(LayoutScreen());
      });
    } catch (error) {
      isLoading = false;

      print(error.toString());
      Get.snackbar('Error Login account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    isLoading = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        isLoading = false;
        saveUserData(user);
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

        print(user);
        Get.offAll(LayoutScreen());
      });
    } catch (error) {
      isLoading = false;

      print(error.toString());
      Get.snackbar('Error create account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUserData(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user?.uid,
        userImage: '',
        name: name ?? user.user?.displayName,
        email: user.user?.email));
  }
}
