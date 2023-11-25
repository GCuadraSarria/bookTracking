import 'package:flutter/material.dart';

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

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// build a Form widget using the _formKey created above.
    return Padding(
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
            const MyTextFormField(
              labelText: 'Libro',
              hintText: 'Nombre del libro o comic',
              validation: true,
            ),
            const MyTextFormField(
              labelText: 'Editorial',
              hintText: 'Nombre de la editorial',
              validation: false,
            ),
            Row(
              children: const [
                Expanded(
                  flex: 4,
                  child: MyTextFormField(
                    labelText: 'Colección',
                    hintText: 'Nombre de la colección',
                    validation: false,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: MyTextFormField(
                    labelText: 'Tomo',
                    hintText: '1',
                    validation: false,
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
                      fillColor: Theme.of(context).colorScheme.surface,
                      labelText: '¿Cuándo sale?',
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
                  )
                : Container(),

            /// submit button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Creado con éxito')),
                        );
                      }
                    },
                    child: const Text('Crear'),
                  ),
                ),
              ],
            ),
          ],
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

  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validation,
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
