import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_shop/Home.dart';
import 'package:my_shop/Login.dart';

import 'Profile.dart';


Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ThemeData lightTheme = ThemeData(
  //     brightness: Brightness.light,
  //     visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  //     primarySwatch: MaterialColor(
  //       0xFFF5E0C3,
  //       <int, Color>{
  //         50: Color(0x1aF5E0C3),
  //         100: Color(0xa1F5E0C3),
  //         200: Color(0xaaF5E0C3),
  //         300: Color(0xaff5e0c3),
  //         400: Color(0xffF5E0C3),
  //         500: Color(0xffEDD5B3),
  //         600: Color(0xffDEC29B),
  //         700: Color(0xffC9A87C),
  //         800: Color(0xffB28E5E),
  //         900: Color(0xff936F3E)
  //       },
  //     ),
  //     primaryColor: Color(0xffEDD5B3),
  //     primaryColorBrightness: Brightness.light,
  //     primaryColorLight: Color(0x1aF5E0C3),
  //     primaryColorDark: Color(0xff936F3E),
  //     canvasColor: Color(0xffE09E45),
  //     accentColor: Color(0xff457BE0),
  //     accentColorBrightness: Brightness.light,
  //     scaffoldBackgroundColor: Color(0xffB5BFD3),
  //     bottomAppBarColor: Color(0xff6D42CE),
  //     cardColor: Color(0xaaF5E0C3),
  //     dividerColor: Color(0x1f6D42CE),
  //     focusColor: Color(0x1aF5E0C3));

  // ThemeData darkTheme = ThemeData(
  //     brightness: Brightness.dark,
  //     visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  //     primarySwatch: MaterialColor(
  //       0xFFF5E0C3,
  //       <int, Color>{
  //         50: Color(0x1a5D4524),
  //         100: Color(0xa15D4524),
  //         200: Color(0xaa5D4524),
  //         300: Color(0xaf5D4524),
  //         400: Color(0x1a483112),
  //         500: Color(0xa1483112),
  //         600: Color(0xaa483112),
  //         700: Color(0xff483112),
  //         800: Color(0xaf2F1E06),
  //         900: Color(0xff2F1E06)
  //       },
  //     ),
  //     primaryColor: Color(0xff5D4524),
  //     primaryColorBrightness: Brightness.dark,
  //     primaryColorLight: Color(0x1a311F06),
  //     primaryColorDark: Color(0xff936F3E),
  //     canvasColor: Color(0xffE09E45),
  //     accentColor: Color(0xff457BE0),
  //     accentColorBrightness: Brightness.dark,
  //     scaffoldBackgroundColor: Color(0xffB5BFD3),
  //     bottomAppBarColor: Color(0xff6D42CE),
  //     cardColor: Color(0xaa311F06),
  //     dividerColor: Color(0x1f6D42CE),
  //     focusColor: Color(0x1a311F06));

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
    );
  }
}
