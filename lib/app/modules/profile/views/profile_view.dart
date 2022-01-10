import 'package:avatar_glow/avatar_glow.dart';
import 'package:social_media_application/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../../controllers/auth_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();

  final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.black,
    buttonColor: Colors.red[900],
  );

  final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF686D76),
    accentColor: Colors.white,
    buttonColor: Colors.red[900],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Get.isDarkMode ? Color(0xFF373A40) : Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Get.theme.accentColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.logout,
              color: Get.theme.accentColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: Duration(seconds: 2),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: 175,
                      height: 175,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset(
                          "assets/logo/noimage.png",
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                  ),
                 Text(
                   authC.user.value.name.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                Text(
                  authC.user.value.email.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  onTap: () => Get.toNamed(Routes.UPDATE_STATUS),
                  leading: const Icon(Icons.note_add_outlined),
                  title: const Text(
                    "Update Status",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () => Get.toNamed(Routes.CHANGE_PROFILE),
                  leading: const Icon(Icons.person),
                  title: const Text(
                    "Change Profile",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () => Get.changeTheme(Get.isDarkMode ? light : dark),
                  leading: Icon(Icons.color_lens),
                  title: const Text(
                    "Change Theme",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Text(Get.isDarkMode ? "Dark" : "Light"),
                ),
              ],
            ),
          ),
          Container(
            margin:
            EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chat App",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                Text(
                  "v.1.0",
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}