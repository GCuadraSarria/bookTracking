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
  Month? date;
  String? category;
  int? edition;

  // Constructor
  Publication({
    required this.name,
    this.date,
    this.category,
    this.edition,
  });
}
