import 'package:doran/View/calendar.dart';
import 'package:doran/View/theme_info.dart';
import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static late SizeHelper sizeHelper;

  @override
  Widget build(BuildContext context) {
    sizeHelper = SizeHelper(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'دوران',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.persianThemeData(context),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context, constrain) {
            MyApp.sizeHelper.update(constrain);
            // ignore: prefer_const_constructors
            return Calendar();
          },
        ),
      ),
    );
  }
}
