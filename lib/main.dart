import 'package:book_tracking/theme/my_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'pages/my_home_page.dart';

void main() async {
  // init hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) => MyThemeProvider(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MyThemeProvider>(context).themeData,
      home: const SafeArea(child: MyHomePage()),
    );
  }
}
