import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elmohandes/controllers/auth_controller.dart';
import 'package:elmohandes/core/constants.dart';
import 'package:elmohandes/core/services/custom_snackbar.dart';
import 'package:elmohandes/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Rx<UserModle> _userModel = UserModle().obs;

  UserModle get user => _userModel.value;

  var membershipMap = {
    -1: 'غير مشترك',
    0: 'اداري',
    1: 'شامل',
    2: 'بلاتنيوم',
    3: 'ماسي',
    4: 'ذهبي',
    5: 'فضي',
    6: 'برونزي',
  };

  Rx<int> _membership;

  String get membership {
    return membershipMap[_membership];
  }

  set user(UserModle value) => _userModel.value = value;

  void clear() => _userModel.value = UserModle();

  @override
  void onReady() async {
    super.onReady();
    var snapshot = await _firestore.collection(usersCollection).doc(AuthController.instance.auth.currentUser.email).get();
    var snapshots = await _firestore.collection(usersCollection).doc(AuthController.instance.auth.currentUser.email).snapshots();
    _membership = Rx<int>(snapshot['membership']);
    _membership.bindStream(snapshot['membership']);
    ever(_membership, _print);
  }

  _print(int n) {
    print('object');
    print(n);
  }

  void createUser(UserModle userModle) async {
    try {
      print(userModle.email);
      await _firestore.collection(usersCollection).doc(userModle.email).set({
        'membership': userModle.membership,
      });
    } catch (e) {
      CustomSnackbar(
        icon: Icons.error,
        title: 'فشل انشاء حساب',
        message: e.message,
      );
    }
  }

  Future<UserModle> getUser(String email) async {
    try {
      DocumentSnapshot snapshot = await _firestore.collection(usersCollection).doc(email).get();
      return UserModle.fromDocumentSnapshot(snapshot);
    } catch (e) {
      CustomSnackbar(
        icon: Icons.error,
        title: 'حدث خطأ ما',
        message: e.message,
      );
      rethrow;
    }
  }
}
