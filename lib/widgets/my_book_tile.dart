import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyBookTile extends StatelessWidget {
  final String name;
  final String? collection;
  final String? editorial;
  final String? tome;
  final String? date;
  final String? price;
  final bool owned;
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
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          // settings option
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12.0),
          ),
          // owned option
          SlidableAction(
            onPressed: shoppedTapped,
            backgroundColor: Colors.green,
            icon: Icons.shopping_cart,
            borderRadius: BorderRadius.circular(12.0),
          )
        ],
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: owned ? Colors.pink : Colors.amber,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(name),
              if (collection != null && collection!.isNotEmpty)
                Text(collection!),
              if (tome != null && tome!.isNotEmpty) Text(tome!),
              if (editorial != null && editorial!.isNotEmpty) Text(editorial!),
              if (date != null && date!.isNotEmpty) Text(date!),
              if (price != null) Text('$price €'),
            ],
          ),
        ),
      ),
    );
  }
}
