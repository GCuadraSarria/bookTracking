import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');

  // instance of data base
  BookTrackingDataBase db = BookTrackingDataBase();

  @override
  void initState() {
    // if this is the first time ever opening the app we send default data, else loadData()
    _myBox.get('PUBLICATIONLIST') == null
        ? db.createInitialData()
        : db.loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('My Homepage'),
      ),
    );
  }
}
