import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumush_tapp/product/model/user_model.dart';
import 'package:jumush_tapp/services/data_base.dart';

class FireStoreService implements DataBase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(UserModel user) async {
    Map<String, dynamic> addUser = user.toJson();

    addUser['createAt'] = FieldValue.serverTimestamp();

    await _fireStore.collection('users').doc(user.userID).set(addUser);

    DocumentSnapshot<Map<String, dynamic>> getUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();
    Map<String, dynamic> readUserMap = getUser.data()!;
    UserModel readUserInfo = UserModel.fromJson(readUserMap);
    print("Uchurdagy koldonuuchu jonundo maalymat:$readUserInfo");
    return true;
  }

  @override
  Future<UserModel> readUser(String userID) async {
    DocumentSnapshot<Map<String, dynamic>> readUser =
        await _fireStore.collection('users').doc(userID).get();

    if (readUser.exists) {
      Map<String, dynamic> readUserMap = readUser.data()!;
      return UserModel.fromJson(readUserMap);
    } else {
      throw Exception("Kullanıcı bulunamadı veya veri alınamadı.");
    }
  }
}
