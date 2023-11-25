import 'package:book_tracking/data/mockup_data.dart';
import 'package:book_tracking/widgets/my_book_tile.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  // checkbox was tapped
  void addShoppedBook(int index) {
    setState(() {
      allPublicationsMockup[index].owned = true;
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
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: allPublicationsMockup.length,
        itemBuilder: ((context, index) {
          var tile = allPublicationsMockup[index];
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
