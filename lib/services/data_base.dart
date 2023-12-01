import 'package:jumush_tapp/product/model/user_model.dart';

abstract class DataBase {
  Future<bool> saveUser(UserModel user);
  Future<UserModel> readUser(String userID);
}
