import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        Get.snackbar("Berhasil", "Email reset password terkirim");
        Get.back();
      } catch (e) {
        Get.snackbar(
            "Terjadi kesalahan", "Tidak dapat mengirim email reset password");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
