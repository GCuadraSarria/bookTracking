import 'package:book_tracking/form/create_new_book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import 'historical_page.dart';
import 'wish_list_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: const [
        WishListPage(),
        HistoricalPage(),
      ][_selectedIndex]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateNewBook()),
            );
          },
          child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: const IconThemeData(
          size: 32.0,
        ),
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
