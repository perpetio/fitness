import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User> signUp(String email, String password, String name) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    final User user = result.user!;
    await user.updateDisplayName(name);

    return user;
  }

  static Future<User> signIn(String email, String password) async {
    final UserCredential result = await auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    final User? user = result.user;

    if (user == null) {
      throw Exception("User not found");
    }

    return user;
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }
}
