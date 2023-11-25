// interface-like class
class Publication {
  String name;
  String? editorial;
  String? tome;
  String? collection;
  bool owned;
  String? date;
  String? price;

  // Constructor
  Publication({
    required this.name,
    this.editorial,
    this.tome,
    this.collection,
    required this.owned,
    this.date,
    this.price,
  });
}
