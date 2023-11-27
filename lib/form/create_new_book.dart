import 'package:book_tracking/pages/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/mockup_data.dart';
import '../models/models.dart';
import '../theme/my_theme.dart';
import '../theme/my_theme_provider.dart';

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
  List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];
  String? selectedMonth; // Default value
  bool isChecked = false;

  // Create an instance of the MyFormData class to store form data
  Publication formData = Publication(name: '', owned: false);

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(actions: [
        /// toggle to switch dark or light mode
        IconButton(
          onPressed: () {
            Provider.of<MyThemeProvider>(context, listen: false).toggleTheme();
          },
          icon: Provider.of<MyThemeProvider>(context).themeData == lightMode
              ? const Icon(Icons.sunny)
              : const Icon(Icons.nightlight),
        ),
      ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// add TextFormFields and ElevatedButton here.
                const Text(
                  'Información',
                ),
                const Divider(),
                MyTextFormField(
                  labelText: 'Libro',
                  hintText: 'Nombre del libro o comic',
                  validation: true,
                  onChanged: (value) {
                    formData.name = value;
                  },
                ),
                MyTextFormField(
                  labelText: 'Editorial',
                  hintText: 'Nombre de la editorial',
                  validation: false,
                  onChanged: (value) {
                    formData.editorial = value;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: MyTextFormField(
                        labelText: 'Colección',
                        hintText: 'Nombre de la colección',
                        validation: false,
                        onChanged: (value) {
                          formData.collection = value;
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MyTextFormField(
                        labelText: 'Tomo',
                        hintText: '1',
                        validation: false,
                        onChanged: (value) {
                          formData.tome = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            formData.owned = value;
                          });
                        }),
                    const Text('Lo tengo!'),
                  ],
                ),

                /// dropdown menu when user unchecks the checkbox
                !isChecked
                    ? DropdownButtonFormField(
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Seleccione un mes'
                              : null;
                        },
                        hint: const Text('Mes'),
                        value: selectedMonth,
                        onChanged: (newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                            formData.date = newValue;
                          });
                        },
                        items: months.map((String month) {
                          return DropdownMenuItem<String>(
                            value: month,
                            child: Text(month),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          labelText: '¿Cuándo sale?',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      )
                    : Container(),

                /// submit or cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          allPublicationsMockup.add(
                            // Add the new Publication to the list
                            Publication(
                              name: formData.name,
                              collection: formData.collection,
                              price: formData.price,
                              editorial: formData.editorial,
                              tome: formData.tome,
                              owned: formData.owned,
                              date: formData.date,
                            ),
                          );

                          // Show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Creado con éxito'),
                              duration: Duration(milliseconds: 500),
                            ),
                          );

                          // Go back after 1 second to give time to read the snackbar
                          Future.delayed(const Duration(milliseconds: 1250),
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()),
                            );
                          });
                        }
                      },
                      child: const Text('Crear'),
                    ),
                  ],
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
  final String hintText;
  final bool validation;
  final ValueChanged<String>? onChanged;

  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
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
          fillColor: Theme.of(context).colorScheme.surface,
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        onChanged: onChanged,
        // The validator receives the text that the user has entered.
        // Conditionally include the validator based on the 'validation' parameter.
        validator: validation
            ? (value) {
                return value == null || value.isEmpty
                    ? 'Rellene el campo'
                    : null;
              }
            : null,
      ),
    );
  }
}
