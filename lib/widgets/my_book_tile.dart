import 'package:flutter/material.dart';

import '../data/mockup_data.dart';
import '../models/models.dart';

class MyBookTile extends StatelessWidget {
  final String name;
  final String? collection;
  final String? editorial;
  final String? tome;
  final String? date;
  final String? price;
  final bool owned;
  final int index;
  final Function(BuildContext?)? settingsTapped;
  final Function(BuildContext?)? shoppedTapped;
  const MyBookTile({
    super.key,
    required this.name,
    this.collection,
    this.price,
    this.editorial,
    this.tome,
    this.date,
    required this.owned,
    this.settingsTapped,
    this.shoppedTapped,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // Filter the list to only include books where owned is false
    List<Publication> wishListBooks =
        allPublicationsMockup.where((tile) => !tile.owned).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,

        /// swipe ( --> ) shopped
        background: Container(
          color: Colors.green,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Icon(Icons.shopping_cart, color: Colors.white),
        ),

        /// swipe ( <-- ) edit
        secondaryBackground: Container(
          color: Colors.grey.shade700,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: const Icon(Icons.edit_document, color: Colors.white),
        ),
        onDismissed: (direction) {
          // Implement your action based on the swipe direction
          if (direction == DismissDirection.endToStart) {
            // Swiped from right to left (edit)
            print('Edited');
          } else if (direction == DismissDirection.startToEnd) {
            wishListBooks[index].owned = true;
            // Swiped from left to right (buy)
            print('Bought');
          }
        },
        child: ListTile(
          tileColor: Theme.of(context).colorScheme.surface,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name),
                  Text(date ?? '', textAlign: TextAlign.right),
                ],
              ),
              Text(collection ?? ''),
              Text(tome ?? ''),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(editorial ?? ''),
                  price != null
                      ? Text('$price €', textAlign: TextAlign.right)
                      : const Text('No price'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
