// interface-like class
class Publication {
  String bookType;
  String name;
  String universe;
  String? collection;
  int? tome;
  String? editorial;
  String bindingType;
  int? pages;
  DateTime? buyDate;
  int? releaseMonth;
  int? releaseYear;
  double? price;
  bool owned;
  bool read;

  // Constructor
  Publication({
    required this.bookType,
    required this.name,
    required this.universe,
    this.collection,
    this.tome,
    this.editorial,
    required this.bindingType,
    this.pages,
    this.buyDate,
    this.releaseMonth,
    this.releaseYear,
    this.price,
    required this.owned,
    required this.read,
  });
}

Map<String, List<String>> universes = {
  'Star Wars': ['Darth Vader', 'Han Solo'],
  'Warhammer': ['Herejía de Orus'],
};

// dropdown lists

// book type
List<String> bookType = [
  'Libro',
  'Comic',
  'Guia',
];

// binding type
List<String> bindingType = [
  'Dura',
  'Blanda',
];
