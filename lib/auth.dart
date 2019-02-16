import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleSignIn() async {
  FirebaseUser currentUser = await _auth.currentUser();
  if (currentUser != null) {
    return currentUser;
  }

  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  if (googleUser == null) {
    return null;
  }

  GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  FirebaseUser user = await _auth.signInWithCredential(
      GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken)
  );

  return user;
}

void handleSignOut() async {
  try {
    await _auth.signOut();
    await _googleSignIn.signOut();
  } catch (e) {
    print(e.toString());
  }
}