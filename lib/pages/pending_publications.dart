import 'package:book_tracking/pages/collection_page.dart';
import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:book_tracking/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class PendingPublications extends StatelessWidget {
  const PendingPublications({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> library = {
      'Star Wars': [
        {
          'collection': 'Darth Vader',
          'books': [
            {'name': 'Book 1', 'pages': 300, 'price': 34.50},
            {'name': 'Book 2', 'pages': 40, 'price': 14.50},
            {'name': 'Book 3', 'pages': 620, 'price': 50.75},
          ],
        },
        {
          'collection': 'The Jedi Ascension',
          'books': [
            {'name': 'Book 4', 'pages': 300, 'price': 34.50},
            {'name': 'Book 5', 'pages': 40, 'price': 14.50},
            {'name': 'Book 6', 'pages': 620, 'price': 50.75},
          ],
        },
      ],
      'Lord of the Rings': [
        {
          'collection': 'Frodet',
          'books': [
            {'name': 'Book 1', 'pages': 300, 'price': 34.50},
            {'name': 'Book 2', 'pages': 40, 'price': 14.50},
            {'name': 'Book 3', 'pages': 620, 'price': 50.75},
          ],
        },
        {
          'collection': 'Samuelet',
          'books': [
            {'name': 'Book 4', 'pages': 300, 'price': 34.50},
            {'name': 'Book 5', 'pages': 40, 'price': 14.50},
            {'name': 'Book 6', 'pages': 620, 'price': 50.75},
          ],
        },
      ],
      'Star Trek': [],
    };

    return Scaffold(
      appBar: const CustomAppBar(title: 'Publicaciones pendientes'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView.builder(
          itemCount: library.length,
          itemBuilder: ((context, index) {
            String universeName = library.keys.elementAt(index);

            return UniverseExpansionTile(
              title: universeName,
              collections: library[universeName]!,
            );
          }),
        ),
      ),
    );
  }
}

class UniverseExpansionTile extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> collections;

  const UniverseExpansionTile({
    super.key,
    required this.title,
    required this.collections,
  });

  @override
  UniverseExpansionTileState createState() => UniverseExpansionTileState();
}

class UniverseExpansionTileState extends State<UniverseExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: CustomListTile(
              title: widget.title,
              onTap: () {
                print(widget.collections);
                print(widget.collections.isEmpty);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollectionPage(
                      appBarTitle: widget.title,
                      collections: widget.collections,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
