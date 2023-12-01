import 'package:flutter/material.dart';
import 'package:jumush_tapp/core/locator/set_up_locator.dart';
import 'package:jumush_tapp/core/repository/user_repository.dart';
import 'package:jumush_tapp/product/model/user_model.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';
import 'package:jumush_tapp/product/navigation/navigator_manager.dart';
import 'package:jumush_tapp/services/auth_base.dart';
import 'package:jumush_tapp/services/fire_store_service.dart';
import 'package:jumush_tapp/services/job_service.dart';

enum ViewState { idle, busy }

final class AuthViewModel extends ChangeNotifier implements AuthBase {
  AuthViewModel() {
    currentUser();
  }
  String? activeCurrentUser;
  ViewState _state = ViewState.idle;
  final UserRepository _userRepository = locator<UserRepository>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();

  UserModel? _user;
  ViewState get state => _state;
  UserModel? get user => _user;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  void updateJobs(String jobID) {
    JobService().deleteJob(jobID, user!.userID!);
    notifyListeners();
  }

// _userRepository.currentUser()
  @override
  Future<UserModel?> currentUser() async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.currentUser();
      return await _fireStoreService.readUser(_user!.userID!);
    } catch (e) {
      debugPrint("View modeldegi current userda kata bar $e");
      return null;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<bool?> signOut() async {
    try {
      state = ViewState.busy;
      _user = null;
      bool? result = await _userRepository.signOut();
      return result;
    } catch (e) {
      return false;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> registerUser(String email, String password) async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.registerUser(email, password);
      await Future.delayed(const Duration(seconds: 1));
      if (_user!.userID!.isNotEmpty) {
        NavigatorManager.instance
            .pushTopageReplacementNamed(NavigateRoutes.profile);
      }
      return _user;
    } finally {
      state = ViewState.idle;
    }
  }

  @override
  Future<UserModel?> singInWithEmail(String email, String password) async {
    try {
      state = ViewState.busy;
      _user = await _userRepository.singInWithEmail(email, password);
      await Future.delayed(const Duration(seconds: 1));
      if (_user!.userID!.isNotEmpty) {
        NavigatorManager.instance
            .pushTopageReplacementNamed(NavigateRoutes.profile);
      }
      return _user;
    } finally {
      state = ViewState.idle;
    }
  }
}
