// enum for months
enum Month {
  enero,
  febrero,
  marzo,
  abril,
  mayo,
  junio,
  julio,
  agosto,
  septiembre,
  octubre,
  noviembre,
  diciembre,
}

// interface-like class
class Publication {
  String name;
  String? editorial;
  int? tome;
  String? category;
  bool released;
  Month? date;
  double? price;

  // Constructor
  Publication({
    required this.name,
    this.editorial,
    this.tome,
    this.category,
    required this.released,
    this.date,
    this.price,
  });
}
