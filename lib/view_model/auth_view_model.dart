import 'package:abeero/core/constants.dart';
import 'package:abeero/model/user_model.dart';
import 'package:abeero/view_model/profile_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/helper/services/firestore_user.dart';
import '../core/local_storage_data.dart';
import '../view/layout/layout_view.dart';

class AuthViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  final ProfileViewModel profileViewModel = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FacebookLogin _facebookLogin = FacebookLogin(debug: true);
  String? email, password, name;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  var isLoading = false.obs;
  var isHidden = true.obs;

  void togglePasswordVisibility() {
    isHidden.value = !isHidden.value;
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      getCurrentUserData(currentUser.uid);
    }
  }

  void googleSignInMethod() async {
    name = null;
    isLoading(true);
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      // User canceled sign-in
      isLoading(false);
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      saveUserDataToFirestore(userCredential);
      Get.offAll(const LayoutView());
    } catch (e) {
      // Handle sign-in error
      if (kDebugMode) {
        print("Error signing in with Google: $e");
      }
      // Handle error state, show error message, etc.
    } finally {
      isLoading(false);
    }
  }

  // void googleSignInMethod() async {
  //   isLoading(true);
  //
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //
  //   final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
  //   isLoading(false);
  //
  //   await _auth.signInWithCredential(credential).then((user) {
  //     saveUserDataToFirestore(user);
  //     Get.offAll(const LayoutView());
  //   });
  // }

  // void facebookSignInMethod() async {
  //   FacebookLoginResult result = await _facebookLogin.logIn();
  //   if (kDebugMode) {
  //     print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  //   }
  //
  //   final accessToken = result.accessToken?.token;
  //
  //   if (result.status == FacebookLoginStatus.success) {
  //     final faceCredential = FacebookAuthProvider.credential(accessToken!);
  //     await _auth.signInWithCredential(faceCredential);
  //   }
  // }

  final ValueNotifier<bool> _isLoadingSignIn = ValueNotifier(false);
  ValueNotifier<bool> get isLoadingSignIn => _isLoadingSignIn;

  void signInWithEmailAndPassword() async {
    try {
      isLoading(true);

      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
        isLoading(false);

        if (kDebugMode) {
          print(value);
        }
        Get.offAll(const LayoutView());
      });
    } catch (error) {
      isLoading(false);

      if (kDebugMode) {
        print(error.toString());
      }
      Get.snackbar('Error Login account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      isLoading(true);

      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        saveUserDataToFirestore(user);
        if (kDebugMode) {
          print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
        }

        if (kDebugMode) {
          print(user);
        }
        isLoading(false);

        Get.offAll(const LayoutView());
      });
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      isLoading(false);

      Get.snackbar('Error create account', error.toString(),
          colorText: KPrimaryColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      if (kDebugMode) {
        print("++++++++++++++++++++++++");
      }
      if (kDebugMode) {
        print(value.data());
      }
      if (kDebugMode) {
        print("++++++++++++++++++++++++");
      }

      setUserData(UserModel.fromJson(value.data() as Map<String, dynamic>));
    });
  }

  // save data in firestore//
  // void saveUserDataToFirestore(UserCredential user) async {
  //   UserModel userModel = UserModel(
  //       userId: user.user?.uid,
  //       userImage: '',
  //       name: name ?? user.user?.displayName,
  //       email: user.user?.email);
  //
  //   await FireStoreUser().addUserToFireStore(userModel);
  //   if (kDebugMode) {
  //     print("set user data in firestore here>>>>>>>>>>>>>>>>>>>>>>>>>");
  //   }
  //   setUserData(userModel);
  //   if (kDebugMode) {
  //     print(userModel.name);
  //     print(userModel.email);
  //     print(userModel.userId);
  //   }
  // }
  void saveUserDataToFirestore(UserCredential user) async {
    String? userId = user.user?.uid;
    String? userEmail = user.user?.email;

    // Check if the user already exists in Firestore
    bool userExists = await FireStoreUser().checkIfUserExists(userEmail!);

    if (userExists) {
      // User already exists in Firestore, do something (e.g., show an error message)
      if (kDebugMode) {
        print("User already exists in Firestore!");
      }
      return;
    } else if (!userExists) {
      // User doesn't exist, so save the user data to Firestore
      UserModel userModel = UserModel(
        userId: userId,
        userImage: '',
        name: name ?? user.user?.displayName,
        email: userEmail,
      );

      await FireStoreUser().addUserToFireStore(userModel);
      if (kDebugMode) {
        print("Set user data in Firestore here >>>>>>>>>>>>>>>>>>>>>>>>>>>");
      }
      setUserData(userModel);
    }
  }

  // save data in shared prefs in case of sign up //
  void setUserData(UserModel userModel) async {
    await localStorageData.setUserData(userModel);
    if (kDebugMode) {
      print("set user data in local cache here>>>>>>>>>>>>>>>>>>>>>>>>>");
    }

    if (kDebugMode) {
      print(userModel.name);
      print(userModel.email);
      print(userModel.userId);
    }
    await profileViewModel.getUserData();
  }

  void signOut() async {
    final currentUser = _auth.currentUser;

    await currentUser?.delete();
  }
}
