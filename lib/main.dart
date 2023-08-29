import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_notes_app/bindings/initial_binding.dart';
import 'package:simple_notes_app/konstant.dart';
import 'package:simple_notes_app/views/login_register_container.dart';
import 'package:simple_notes_app/views/main_view.dart';
import 'package:simple_notes_app/views/settings_view.dart';

// var kColorScheme =
//     ColorScheme.fromSwatch(primarySwatch: createMaterialColor(Colors.teal));
var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.teal);

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "OpenSans").copyWith(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: kColorScheme.primary,
          titleTextStyle: const TextStyle(
              fontFamily: "Pangolin", fontSize: 22, color: Colors.white),
        ),
        colorScheme: kColorScheme,
        textTheme: Konstant.textTheme.copyWith(
          titleLarge: Konstant.textTheme.titleLarge!.copyWith(fontSize: 20),
          bodyMedium: Konstant.textTheme.bodyMedium!.copyWith(fontSize: 16),
          labelSmall: Konstant.textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ),
      initialBinding: InitialBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const MainView(),
        ),
        GetPage(
          name: "/login",
          page: () => LoginRegisterContainer(),
        ),
        GetPage(
          name: "/settings",
          page: () => SettingsView(),
        ),
      ],
    ),
  );
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
