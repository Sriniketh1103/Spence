import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInService {
  static GoogleSignInAccount? _currentUser;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static Future<void> initializeGoogleSignIn() async {
    // Initialize and listen to authentication events
    await _googleSignIn.initialize();

    _googleSignIn.authenticationEvents.listen((event) {
      _currentUser = switch (event) {
        GoogleSignInAuthenticationEventSignIn() => event.user,
        GoogleSignInAuthenticationEventSignOut() => null,
      };
    });
  }

  static Future<void> signIn() async {
    try {
      // Check if platform supports authenticate
      if (_googleSignIn.supportsAuthenticate()) {
        final GoogleSignInAccount? user = await _googleSignIn.authenticate();
        final GoogleSignInAuthentication googleAuth =
            await user!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
      } else {
        // Handle web platform differently
        print('This platform requires platform-specific sign-in UI');
      }
    } catch (e) {
      print('Sign-in error: $e');
    }
  }

  static Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    _currentUser = null;
  }

  static GoogleSignInAccount? get currentUser => _currentUser;
}
