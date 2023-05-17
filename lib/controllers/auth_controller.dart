import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studious_app/firebase_ref/refrences.dart';
import 'package:studious_app/screens/home/home_screen.dart';
import 'package:studious_app/screens/login/login_screen.dart';
import 'package:studious_app/widgets/dialog/dialog_widget.dart';

import '../applogger.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final Rxn<User> _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final authAccount = await account.authentication;
        final credential = GoogleAuthProvider.credential(
            idToken: authAccount.idToken, accessToken: authAccount.accessToken);
        await _auth.signInWithCredential(credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      print("$error");
      // AppLogger.e(error) -->to be called so need to build this
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void showLoginAlertDialog() {
    Get.dialog(Dialogs.questionStartDialog(onTap: (() {
      Get.back();
      navigateToLoginPage();
    })), barrierDismissible: false);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  void navigateToLoginPage() {
    Get.toNamed(LoginScreen.routerName);
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  Future<void> signOut() async {
    AppLogger.d('Sign out');
    try {
      await _auth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      AppLogger.e('Signout falied');
    }
  }

  void navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
