import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

class BookTrackingDataBase {
  List<Publication> allPublications = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method the very first time we open the app
  void createInitialData() {
    allPublications = [
      Publication(name: 'Miguel Aladrén Castillo'),
      Publication(name: 'Es un niño bonito'),
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
