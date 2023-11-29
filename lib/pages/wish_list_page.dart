import 'package:book_tracking/data/mockup_data.dart';
import 'package:book_tracking/widgets/my_book_tile.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  // Filter the list to only include books where owned is false
  List<Publication> wishListBooks =
      allPublicationsMockup.where((tile) => !tile.owned).toList();

  // checkbox was tapped
  void addShoppedBook(int index) {
    setState(() {
      wishListBooks[index].owned = true;
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
            tome: tile.tome.toString(),
            date: tile.buyDate.toString(),
            price: tile.price.toString(),
            owned: tile.owned,
            settingsTapped: (context) => openBookSettings(index),
            shoppedTapped: (context) => addShoppedBook(index),
            index: index,
          );
        }),
      ),
    );
  }
}
