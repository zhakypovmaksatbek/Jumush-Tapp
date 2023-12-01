import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumush_tapp/core/locator/set_up_locator.dart';
import 'package:jumush_tapp/product/model/user_model.dart';
import 'package:jumush_tapp/services/auth_base.dart';
import 'package:jumush_tapp/services/fire_store_service.dart';
import 'package:jumush_tapp/services/firebase_auth_service.dart';

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  final CollectionReference usersCountCollection =
      FirebaseFirestore.instance.collection('usersCount');

  @override
  Future<UserModel?> currentUser() async {
    UserModel? user = await _firebaseAuthService.currentUser();
    return await _fireStoreService.readUser(user!.userID!);
  }

  @override
  Future<UserModel?> registerUser(String email, String password) async {
    UserModel? user = await _firebaseAuthService.registerUser(email, password);
    bool result = await _fireStoreService.saveUser(user!);
    if (result) {
      usersCountCollection.doc('count').get().then((doc) {
        if (doc.exists) {
          // Belge varsa sayacı artır
          usersCountCollection
              .doc('count')
              .update({'count': FieldValue.increment(1)});
        } else {
          // Belge yoksa oluştur
          usersCountCollection.doc('count').set({'count': 1});
        }
      });
      return await _fireStoreService.readUser(user.userID!);
    } else {
      return null;
    }
  }

  @override
  Future<bool?> signOut() async {
    return await _firebaseAuthService.signOut();
  }

  @override
  Future<UserModel?> singInWithEmail(String email, String password) async {
    UserModel? user =
        await _firebaseAuthService.singInWithEmail(email, password);
    return await _fireStoreService.readUser(user!.userID!);
  }
}
