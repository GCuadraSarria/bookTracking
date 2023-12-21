import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PendingPublications extends StatelessWidget {
  const PendingPublications({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, Map<String, Map<String, dynamic>>>> library =
        {
      'Star Wars': {
        'Darth Vader': {
          'book1': {'pages': 300, 'price': 34.50},
          'book2': {'pages': 40, 'price': 14.50},
          'book3': {'pages': 620, 'price': 50.75},
        },
        'The Jedi Ascension': {
          'book4': {'pages': 300, 'price': 34.50},
          'book5': {'pages': 40, 'price': 14.50},
          'book6': {'pages': 620, 'price': 50.75},
        },
      },
      'Lord of the Rings': {
        'Frodet': {
          'book1': {'pages': 300, 'price': 34.50},
          'book2': {'pages': 40, 'price': 14.50},
          'book3': {'pages': 620, 'price': 50.75},
        },
        'Samuelet': {
          'book4': {'pages': 300, 'price': 34.50},
          'book5': {'pages': 40, 'price': 14.50},
          'book6': {'pages': 620, 'price': 50.75},
        },
      },
      'Star Trek': {},
    };

    return Scaffold(
      appBar: const CustomAppBar(title: 'Publicaciones pendientes'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            for (var universeTitle in library.keys)
              UniverseExpansionTile(
                title: universeTitle,
                subItems: library[universeTitle]!.keys.toList(),
                nestedLibrary: library[universeTitle]!,
              ),
          ],
        ),
      ),
    );
  }
}

class UniverseExpansionTile extends StatefulWidget {
  final String title;
  final List<String> subItems;
  final Map<String, dynamic> nestedLibrary;

  const UniverseExpansionTile({
    super.key,
    required this.title,
    required this.subItems,
    required this.nestedLibrary,
  });

  @override
  UniverseExpansionTileState createState() => UniverseExpansionTileState();
}

class UniverseExpansionTileState extends State<UniverseExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: _isExpanded
              ? EdgeInsets.zero
              : const EdgeInsets.only(bottom: 16.0),
          child: ListTile(
            minVerticalPadding: 16.0,
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(5.0)),
            ),
            tileColor: _isExpanded
                ? const Color.fromRGBO(255, 192, 203, 0.2)
                : Colors.grey[850],
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.pink[300]),
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ),
        if (_isExpanded)
          Column(
            children: [
              for (var subItem in widget.subItems)
                CollectionExpansionTile(
                  title: subItem,
                  subItems: widget.nestedLibrary[subItem]?.keys.toList() ?? [],
                  nestedLibrary: widget.nestedLibrary[subItem] ?? {},
                ),
            ],
          ),
      ],
    );
  }
}

class CollectionExpansionTile extends StatefulWidget {
  final String title;
  final List<String> subItems;
  final Map<String, dynamic> nestedLibrary;

  const CollectionExpansionTile({
    super.key,
    required this.title,
    required this.subItems,
    required this.nestedLibrary,
  });

  @override
  CollectionExpansionTileState createState() => CollectionExpansionTileState();
}

class CollectionExpansionTileState extends State<CollectionExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: _isExpanded
              ? EdgeInsets.zero
              : const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            tileColor: _isExpanded
                ? const Color.fromRGBO(255, 192, 203, 0.3)
                : Colors.grey[700],
            title: Text(widget.title),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ),
        if (_isExpanded)
          Column(
            children: [
              for (var subItem in widget.subItems)
                BookInformationTile(
                  title: subItem,
                  nestedLibrary: widget.nestedLibrary[subItem] ?? {},
                ),
            ],
          ),
      ],
    );
  }
}

class BookInformationTile extends StatelessWidget {
  final String title;
  final Map<String, dynamic> nestedLibrary;

  const BookInformationTile({
    super.key,
    required this.title,
    required this.nestedLibrary,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.grey[600],
          title: Text(title),
        ),
      ],
    );
  }
}
