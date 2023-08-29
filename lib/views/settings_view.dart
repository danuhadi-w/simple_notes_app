import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/konstant.dart';
import 'package:simple_notes_app/widgets/main_drawer.dart';

class SettingsView extends GetView {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = false.obs;
    // var controller = Get.put(MainViewController());
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("App Settings"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          print("test");
          return true;
        },
        child: Container(
          margin: Konstant.insets10,
          child: Column(
            children: [
              Obx(
                () => SwitchListTile(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  inactiveTrackColor: Colors.grey,
                  value: isDarkTheme.value,
                  onChanged: (newValue) => isDarkTheme.value = newValue,
                  title: const Text(
                    "Dark Theme",
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: const Text("Enable or disable Dark theme."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
