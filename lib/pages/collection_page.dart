import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:book_tracking/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  final List<Map<String, dynamic>> collections;
  final String appBarTitle;

  const CollectionPage(
      {super.key, required this.collections, required this.appBarTitle});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.appBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: widget.collections.isEmpty
            ? const Center(
                child: Text(
                  'No hay colecciones',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : ListView.builder(
                itemCount: widget.collections.length,
                itemBuilder: (context, index) {
                  String collectionName =
                      widget.collections[index]['collection'];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomListTile(
                      title: collectionName,
                      onTap: () {
                        // Aquí puedes manejar el onTap para cada colección
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
