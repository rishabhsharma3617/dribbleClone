import 'package:dribblestack/screens/home/index.dart';
import 'package:dribblestack/services/responsive_service.dart';
import 'package:dribblestack/utils/extensions/hex.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Pulpdisplay',
            colorScheme: ColorScheme.light(
              primary: HexColor.fromHex('#10101e'),
              secondary: HexColor.fromHex('#f5f5f6'),
              secondaryVariant: HexColor.fromHex('#87878e'),
              primaryVariant: HexColor.fromHex('#ff9b75'),
            )),
        home: HomeScreen());
  }
}

// TODO
// Add theme data in Different file
