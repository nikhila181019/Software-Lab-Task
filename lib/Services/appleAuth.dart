import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential> signInWithApple() async {
  try {
    // Request credential for Apple Sign In
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // Create OAuthCredential from Apple Sign In credential
    final OAuthCredential oauthCredential = OAuthProvider("apple.com").credential(
      accessToken: credential.identityToken,
      idToken: credential.authorizationCode,
    );

    // Sign in with Firebase using the OAuthCredential
    return await _auth.signInWithCredential(oauthCredential);
  } catch (e) {
    // Handle errors
    print('Failed to sign in with Apple: $e');
    rethrow; // Rethrow the error for handling in UI
  }
}
