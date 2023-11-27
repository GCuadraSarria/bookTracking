import 'package:book_tracking/data/mockup_data.dart';
import 'package:book_tracking/widgets/my_book_tile.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class HistoricalPage extends StatefulWidget {
  const HistoricalPage({super.key});

  @override
  State<HistoricalPage> createState() => _HistoricalPageState();
}

class _HistoricalPageState extends State<HistoricalPage> {
  // Filter the list to only include books where owned is true
  List<Publication> wishListBooks =
      allPublicationsMockup.where((tile) => tile.owned).toList();

  // checkbox was tapped
  void addShoppedBook(int index) {
    setState(() {
      allPublicationsMockup[index].owned = false;
    });
  }

  // checkbox was tapped
  void openBookSettings(int index) {
    setState(() {
      print('Settings of ${allPublicationsMockup[index].name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        itemCount: wishListBooks.length,
        itemBuilder: ((context, index) {
          var tile = wishListBooks[index];
          return MyBookTile(
            name: tile.name,
            collection: tile.collection,
            editorial: tile.editorial,
            tome: tile.tome,
            date: tile.date,
            price: tile.price,
            owned: tile.owned,
            settingsTapped: (context) => openBookSettings(index),
            shoppedTapped: (context) => addShoppedBook(index),
          );
        }),
      ),
    );
  }
}
