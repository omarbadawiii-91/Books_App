import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authgoogle {
  Future<Object> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUsersignin = await GoogleSignIn.instance
        .authenticate();
    if (googleUsersignin == null) {
      return Null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        googleUsersignin.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
