import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumush_tapp/product/model/user_model.dart';
import 'package:jumush_tapp/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<UserModel?> currentUser() async {
    try {
      User user = _firebaseAuth.currentUser!;
      return _userFromFirebase(user);
    } catch (e) {
      return null;
    }
  }

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(
      userID: user.uid,
      email: user.email,
    );
  }

  @override
  Future<bool?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserModel?> singInWithEmail(String email, String password) async {
    final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return _userFromFirebase(response.user);
  }

  @override
  Future<UserModel?> registerUser(String email, String password) async {
    try {
      final response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(response.user);
    } finally {}
  }
}
