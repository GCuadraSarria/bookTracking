class Library {
  List<Universe> universes;
}

class Universe {
  String name;
  List<Collection> collections;
}

class Collection {
  String name;
  List<Publication> publications;
}

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
  bool isOwned;
  bool isRead;
}
