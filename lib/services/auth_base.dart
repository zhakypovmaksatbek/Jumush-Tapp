import 'package:jumush_tapp/product/model/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> currentUser();
  Future<UserModel?> singInWithEmail(String email, String password);
  Future<UserModel?> registerUser(String email, String password);
  Future<bool?> signOut();
}
