import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class BookTrackingDataBase {
  List<Publication> allPublications = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method the very first time we open the app
  void createInitialData() {
    allPublications = [
      Publication(
          name: 'Miguel Aladrén Castillo',
          collection: 'Star Wars',
          price: '24.50',
          editorial: 'Altaya',
          tome: '3',
          date: 'Diciembre',
          owned: false),
      Publication(
          name: 'Es un niño bonito',
          collection: 'Titanes sensuales',
          price: '19.75',
          editorial: 'Salvat',
          tome: '1',
          owned: true),
    ];
  }

  // load the data from database
  void loadData() {
    allPublications = _myBox.get('PUBLICATIONLIST');
  }

  // update the database
  void updateData() {
    _myBox.put('PUBLICATIONLIST', allPublications);
  }
}
