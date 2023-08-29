import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget drawerItemBuilder(
    BuildContext context,
    IconData iconData,
    String title,
  ) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop();
        if (title == "My notes") {
          if (Get.currentRoute != "/") {
            Navigator.of(context).pop();
          }
        } else if (title == "Settings") {
          Get.toNamed("/settings");
        }
      },
      leading: Icon(iconData),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Stack(
          children: [
            Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text("What's up?"),
                ),
                drawerItemBuilder(context, Icons.description, "My notes"),
                drawerItemBuilder(context, Icons.settings, "Settings"),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black12,
                  ),
                  drawerItemBuilder(context, Icons.logout, "Logout"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
