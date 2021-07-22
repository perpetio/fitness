import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User> signUp(String email, String password, String name) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User user = result.user!;
    await user.updateDisplayName(name);

    return user;
  }
}
