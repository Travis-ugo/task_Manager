import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ServiceAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? authStateChange() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    return auth.currentUser;
  }

  createAccountWithEmailAndPassword(String email, String password) {
    try {
      var userCredentials =
          auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  emailAndPasswordAuthSignIn(String email, String password) {
    try {
      var userCredentials =
          auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  verifyCredentials(String email) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
  }

  signOutFunction() {
    auth.signOut();
  }
}
