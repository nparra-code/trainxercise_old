import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginState with ChangeNotifier {
  bool loggedIn = false;
  bool loading = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoggedIn() => loggedIn;

  void login() async {
    loading = true;
    notifyListeners();

    var user = await _handleSignIn();

    loading = false;

    if (user != null) {
      loggedIn = true;
      notifyListeners();
    } else {
      loggedIn = false;
      notifyListeners();
    }
  }

  void logout() {
    googleSignIn.signOut();
    loggedIn = false;
    notifyListeners();
  }

  Future<User?> _handleSignIn() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCred = await auth.signInWithCredential(credential);
    final User? user = userCred.user;
    if (user != null) print(user.displayName);
    return user;
  }
}
