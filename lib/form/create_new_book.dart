import 'package:book_tracking/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import '../data/mockup_data.dart';
import '../models/models.dart';

// Define a custom Form widget.
class CreateNewBook extends StatefulWidget {
  const CreateNewBook({super.key});

  @override
  CreateNewBookState createState() {
    return CreateNewBookState();
  }
}

// This class holds data related to the form.
class CreateNewBookState extends State<CreateNewBook> {
  bool isChecked = false;

  // Create an instance of the MyFormData class to store form data
  Publication formData = Publication(
    bookType: '',
    name: '',
    universe: '',
    collection: '',
    tome: 0,
    editorial: '',
    bindingType: '',
    pages: 0,
    buyDate: null,
    releaseMonth: DateTime.now().month,
    releaseYear: DateTime.now().year,
    price: 0.00,
    owned: false,
    read: false,
  );

  String? selectedBookType;
  String? selectedUniverse;
  String? selectedCollection;

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// build a Form widget using the _formKey created above.
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Textfield name
                const Text('Información'),
                const Divider(),
                MyTextFormField(
                  labelText: 'Título',
                  validation: true,
                  onChanged: (value) => formData.name,
                ),

                // Dropdown book type
                DropdownButtonFormField(
                  isDense: true,
                  validator: (value) {
                    return value == null ? 'Seleccione un tipo' : null;
                  },
                  hint: const Text('Tipo'),
                  value: selectedBookType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedBookType = newValue!;
                      formData.bookType = newValue;
                    });
                  },
                  items: bookType.map((String booktype) {
                    return DropdownMenuItem<String>(
                      value: booktype,
                      child: Text(booktype),
                    );
                  }).toList(),
                ),

                // Dropdown universe
                DropdownButtonFormField(
                  isDense: true,
                  validator: (value) {
                    return value == null ? 'Seleccione un universo' : null;
                  },
                  hint: const Text('Universo'),
                  value: selectedUniverse,
                  onChanged: (newValue) {
                    setState(() {
                      selectedUniverse = newValue;
                      formData.universe = newValue!;
                      print('NewValue: $newValue');
                      print('Universo: $selectedUniverse');
                      print('---------------');
                      print('Colección: $selectedCollection');
                      print('---------------');
                      // reset collection dropdown
                      // selectedCollection = null;
                    });
                  },
                  items: universes.keys.map((String universe) {
                    return DropdownMenuItem<String>(
                      value: universe,
                      child: Text(universe),
                    );
                  }).toList(),
                ),

                // Dropdown collection
                DropdownButtonFormField(
                  isDense: true,
                  validator: (value) {
                    return value == null ? 'Seleccione una colección' : null;
                  },
                  hint: const Text('Colección'),
                  value: selectedCollection,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCollection = newValue! as String?;
                      formData.collection = newValue as String?;
                    });
                  },
                  items: selectedUniverse != null
                      ? universes[selectedUniverse]?.map((String collection) {
                          return DropdownMenuItem<String>(
                            value: collection,
                            child: Text(collection),
                          );
                        }).toList()
                      : [], // Show an empty list if no universe is selected
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Form field with optional validation
class MyTextFormField extends StatelessWidget {
  final String labelText;
  final bool validation;
  final ValueChanged<String>? onChanged;

  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.validation,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          labelText: labelText,
          hintStyle: const TextStyle(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        onChanged: onChanged,
        // The validator receives the text that the user has entered.
        // Conditionally include the validator based on the 'validation' parameter.
        validator: validation
            ? (value) {
                return value == null || value.isEmpty
                    ? 'Campo obligatorio'
                    : null;
              }
            : null,
      ),
    );
  }
}
