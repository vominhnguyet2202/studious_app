import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studious_app/firebase_ref/refrences.dart';
import 'package:studious_app/screens/login/login_screen.dart';
import 'package:studious_app/widgets/dialog/dialog_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;

  // final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      // _user.value = user;
    });
    navigateIntroduction();
  }

  singInWithGoogle() async {
    final GoogleSignIn _googleSingIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSingIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAccount.idToken,
          accessToken: _authAccount.accessToken,
        );
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } catch (e) {
      e.printError();
    }
  }

  // User? getUser() {
  //   _user.value = _auth.currentUser;
  //   return _user.value;
  // }

  Future<void> signOut() async {
    // AppLogger.d('Sign out');
    try {
      await _auth.signOut();
      // navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      // AppLogger.e('Signout falied');

    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialog() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
      navigaterToLoginPage(); // chuyen ve trang login
    }), barrierDismissible: false);
  }

  void navigaterToLoginPage() {
    Get.toNamed(LoginScreen.routerName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
