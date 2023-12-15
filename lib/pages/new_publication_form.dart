import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NewPublicationForm extends StatefulWidget {
  const NewPublicationForm({super.key});

  @override
  NewPublicationFormState createState() {
    return NewPublicationFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class NewPublicationFormState extends State<NewPublicationForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<NewPublicationFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: const CustomAppBar(title: 'Añadir nueva publicación'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyTextField(
                label: 'Nombre del libro',
                validator: true,
              ),
              const SizedBox(height: 16.0),
              const UniverseDropdownMenuRow(),
              const SizedBox(height: 16.0),
              MySubmitButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
            elevation: MaterialStateProperty.all(4.0),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            backgroundColor: MaterialStateProperty.all(Colors.pink[300]),
            shadowColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              //TODO submit
            }
          },
          child: Text(
            'Añadir',
            style: TextStyle(
                color: Colors.grey[850],
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class MyTextField extends StatelessWidget {
  final String label;
  final bool validator;
  const MyTextField({super.key, required this.label, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: Colors.pink[300]),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Campo obligatorio';
        }
        return null;
      },
    );
  }
}

class UniverseDropdownMenuRow extends StatefulWidget {
  const UniverseDropdownMenuRow({super.key});

  @override
  State<UniverseDropdownMenuRow> createState() =>
      _UniverseDropdownMenuRowState();
}

class _UniverseDropdownMenuRowState extends State<UniverseDropdownMenuRow> {
  TextEditingController universeController = TextEditingController();
  final Map<String, Map<String, Map<String, Map<String, dynamic>>>> library = {
    'Star Wars': {
      'Darth Vader': {
        'book1': {'pages': 300, 'price': 34.50},
        'book2': {'pages': 40, 'price': 14.50},
        'book3': {'pages': 620, 'price': 50.75},
      },
      'The Jedi Ascension': {
        'book4': {'pages': 300, 'price': 34.50},
        'book5': {'pages': 40, 'price': 14.50},
        'book6': {'pages': 620, 'price': 50.75},
      },
    },
    'Lord of the Rings': {
      'Frodet': {
        'book1': {'pages': 300, 'price': 34.50},
        'book2': {'pages': 40, 'price': 14.50},
        'book3': {'pages': 620, 'price': 50.75},
      },
      'Samuelet': {
        'book4': {'pages': 300, 'price': 34.50},
        'book5': {'pages': 40, 'price': 14.50},
        'book6': {'pages': 620, 'price': 50.75},
      },
    },
    'Star Trek': {},
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownMenu(
            inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: Colors.pink[300],
              labelStyle: TextStyle(color: Colors.pink[300]),
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: universeController,
            label: const Text('Seleccione universo'),
            onSelected: (universe) {
              setState(() {});
            },
            dropdownMenuEntries:
                library.keys.map<DropdownMenuEntry<String>>((String universe) {
              return DropdownMenuEntry<String>(
                value: universe,
                label: universe,
              );
            }).toList(),
          ),
        ),
        IconButton.filled(
          onPressed: () {},
          icon: const Icon(Icons.add),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.pink[200]),
            iconColor: MaterialStateProperty.all(Colors.grey[850]),
          ),
        ),
      ],
    );
  }
}
