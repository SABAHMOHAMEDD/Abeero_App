import 'package:abeero/core/IconBroken.dart';
import 'package:abeero/core/constants.dart';
import 'package:abeero/view/Auth/SignIn_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/profile_view_model.dart';
import '../widgets/list_tile_item.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.isLoading.value
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 58,
                        backgroundColor: KScaffoldColor,
                        backgroundImage: controller.userModel.userImage == null
                            ? const AssetImage("assets/images/user.png")
                            : controller.userModel.userImage == "default"
                                ? const AssetImage("assets/images/user.png")
                                : NetworkImage(controller.userModel.userImage!)
                                    as ImageProvider,
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userModel.name ?? "",
                              style: const TextStyle(fontSize: 26),
                            ),
                            Text(
                              controller.userModel.email ?? "",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  const ListTileItem(
                    title: 'Edit Profile',
                    leadingIcon: IconBroken.Edit,
                  ),
                  const ListTileItem(
                    title: 'Shipping Address',
                    leadingIcon: IconBroken.Location,
                  ),
                  const ListTileItem(
                    title: 'Order History',
                    leadingIcon: IconBroken.Time_Circle,
                  ),
                  const ListTileItem(
                    title: 'Notification',
                    leadingIcon: IconBroken.Notification,
                  ),
                  GestureDetector(
                      onTap: () {
                        controller.signOut();
                        Get.offAll(SignInView());
                      },
                      child: const ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Log Out',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        leading: Icon(
                          IconBroken.Logout,
                          size: 28,
                          color: KPrimaryColor,
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}
