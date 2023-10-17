import 'package:abeero/core/constants.dart';
import 'package:abeero/model/user_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/local_storage_data.dart';
import '../helper/services/firestore_user.dart';
import '../view/layout_view.dart';

class AuthViewModel extends GetxController {
  // final LocalStorageData localStorageData = Get.put(LocalStorageData());
  final LocalStorageData localStorageData = Get.find();
  final ProfileViewModel profileViewModel = Get.find();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  ValueNotifier<bool> get isLoading => _isLoading;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin(debug: true);
  String? email, password, name;

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
    FacebookLoginResult result = await _facebookLogin.logIn();
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

    final accessToken = result.accessToken?.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken!);
      await _auth.signInWithCredential(faceCredential);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      _isLoading.value = true;

      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        // await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
        //   print("++++++++++++++++++++++++");
        //   print(value);
        //   print(value.data());
        //   print("++++++++++++++++++++++++");
        //
        //   // setUserData(UserModel.fromJson(value.data() as Map<String, dynamic>));
        // });

        _isLoading.value = false;

        print(value);
        Get.offAll(LayoutScreen());
      });
    } catch (error) {
      _isLoading.value = false;

      print(error.toString());
      Get.snackbar('Error Login account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    _isLoading.value = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        _isLoading.value = false;
        saveUserData(user);
        print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');

        print(user);
        Get.offAll(LayoutScreen());
      });
    } catch (error) {
      _isLoading.value = false;

      print(error.toString());
      Get.snackbar('Error create account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // save data in firestore//
  void saveUserData(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user?.uid,
        userImage: '',
        name: name ?? user.user?.displayName,
        email: user.user?.email);

    await FireStoreUser().addUserToFireStore(userModel);
    setUserData(userModel);
  }

  // save data in shared prefs//
  void setUserData(UserModel userModel) async {
    await localStorageData.setUserData(userModel);
  }
}
