import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  // Trigger the Google Sign In flow
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  // Obtain the GoogleSignInAuthentication object
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;

  // Create a new credential
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  // Once signed in, return the UserCredential
  return await _auth.signInWithCredential(credential);
}
