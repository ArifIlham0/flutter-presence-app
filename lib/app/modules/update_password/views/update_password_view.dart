import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_password_controller.dart';

class UpdatePasswordView extends GetView<UpdatePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Password'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.currC,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Current Password",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.newC,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "New Password",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller.confirmC,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Confirm New Password",
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.updatePass();
                  }
                },
                child: Text((controller.isLoading.isFalse) ? "Update" : "Loading.."),
              ),
            ),
          ],
        ));
  }
}
