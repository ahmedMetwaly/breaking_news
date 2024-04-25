import 'package:breaking_news/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../generated/l10n.dart';

class FirebaseAuthService {
  static userState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!\nemial:${user.email}');
      }
    });
  }

  static Future signUp(
      {required String emailAddress, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return UserModel(
          uid: credential.user?.uid ?? "0",
          name: credential.user?.displayName ?? "",
          email: credential.user?.email ?? "",
          imageUrl: credential.user?.photoURL ?? "",
          emailVerfied: credential.user?.emailVerified ?? false,
          password: "");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return S.current.passErrorSignUp;
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return S.current.emailErrorSignUp;
        //print('The account already exists for that email.');
      }
    } catch (e) {
      return e;
    }
  }

  static Future signIn(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return UserModel(
          uid: credential.user?.uid ?? "0",
          name: credential.user?.displayName ?? "",
          email: credential.user?.email ?? "",
          imageUrl: credential.user?.photoURL ?? "",
          emailVerfied: credential.user?.emailVerified ?? false,
          password: '');
    } on FirebaseAuthException catch (e) {
      // print("login exception : ${e.code}");
      if (e.code == "invalid-credential") {
        return S.current.loginError;
      }
      if (e.code == 'user-not-found') {
        return S.current.noUser;
      } else if (e.code == 'wrong-password') {
        return S.current.wrongPass;
      }
    } catch (e) {
      return e;
    }
  }

  static Future signInWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final user = await auth.signInWithCredential(credential);
      return UserModel(
          uid: user.user?.uid ?? "0",
          name: user.user?.displayName ?? "",
          email: user.user?.email ?? "",
          imageUrl: user.user?.photoURL ?? "",
          phoneNumber: user.user?.phoneNumber ?? "",
          emailVerfied: user.user?.emailVerified ?? false,
          password: '');
    } catch (e) {
      return e.toString();
    }
  }

  static Future signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      final user = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return UserModel(
          uid: user.user?.uid ?? "0",
          name: user.user?.displayName ?? "",
          email: user.user?.email ?? "",
          imageUrl: user.user?.photoURL ?? "",
          phoneNumber: user.user?.phoneNumber ?? "",
          emailVerfied: user.user?.emailVerified ?? false,
          password: '');
    } catch (error) {
      return error.toString();
    }
  }

  static Future logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  // Future<void> signOutFromGoogle() async{
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   await googleSignIn.signOut();
  //   await auth.signOut();
  // }
  static Future forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Show a success message to the user
      //print("Password reset link sent to your email!");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       // print('No user found for this email.');
        // Show an error message to the user (e.g., "Email not found")
        return S.current.noUser;
      } else {
        // print(e.message);
        // Handle other exceptions (e.g., network errors)
        return e.toString();
      }
    }
  }
}
