

import 'package:busreservation/screens/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:busreservation/screens/buslist.dart';
import 'package:busreservation/screens/login-screen.dart';


var kColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(219, 25, 3, 114));
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(219, 25, 3, 114)),
      appBarTheme: AppBarTheme(
        backgroundColor: kColorScheme.onBackground,
        foregroundColor: kColorScheme.onPrimary
      ),
      ),
      home:LoginScreen()
    );
  }
}