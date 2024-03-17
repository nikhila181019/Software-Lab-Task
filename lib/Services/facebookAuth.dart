import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signInWithFacebook() async {
  // Trigger the Facebook Sign In flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Check if the login was successful
  if (loginResult.status == LoginStatus.success) {
    // Obtain the Facebook access token
    final AccessToken? accessToken = loginResult.accessToken;

    // Create a FacebookAuthCredential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(accessToken!.token);

    // Sign in the user with Firebase using the FacebookAuthCredential
    return await _auth.signInWithCredential(facebookAuthCredential);
  } else {
    // If the login failed, throw an error or return null
    throw FirebaseAuthException(
      message: 'Failed to sign in with Facebook: ${loginResult.status}',
      code: 'facebook_sign_in_failed',
    );
  }
}
