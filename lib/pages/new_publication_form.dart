import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NewPublicationForm extends StatefulWidget {
  const NewPublicationForm({super.key});

  @override
  NewPublicationFormState createState() {
    return NewPublicationFormState();
  }
}

// text input controllers
TextEditingController nameController = TextEditingController();
TextEditingController pagesController = TextEditingController();
TextEditingController tomeController = TextEditingController();

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
              MyTextField(
                  label: 'Nombre', validator: true, controller: nameController),
              const SizedBox(height: 16.0),
              const UniverseDropdownMenuRow(),
              const SizedBox(height: 16.0),
              const CollectionDropdownMenuRow(),
              const SizedBox(height: 16.0),
              const EditorialDropdownRow(),
              const SizedBox(height: 16.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const Expanded(child: BookTypeDropdown()),
                const SizedBox(width: 16.0),
                const Expanded(child: BindingTypeDropdown()),
                const SizedBox(width: 16.0),
                Expanded(
                    child: MyTextField(
                        label: 'Tomo',
                        numeric: true,
                        controller: tomeController))
              ]),
              const SizedBox(height: 16.0),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Expanded(child: SelectMonthDropdown()),
                SizedBox(width: 16.0),
                Expanded(child: SelectYearDropdown()),
              ]),
              const SizedBox(height: 16.0),
              MyTextField(
                  label: 'Páginas', numeric: true, controller: pagesController),
              const SizedBox(height: 32.0),
              MySubmitButton(formKey: _formKey),
            ],
          ),
        ),
      ),
    );
  }
}

// Submit form button
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
              // Get values from form
              String nameValue = nameController.text;
              String universeValue = (universeController.text.isNotEmpty)
                  ? universeController.text
                  : 'No universe selected';
              String collectionValue = (collectionController.text.isNotEmpty)
                  ? collectionController.text
                  : 'No collection selected';
              String editorialValue =
                  editorialController ?? 'No editorial selected';
              String bindingTypeValue =
                  bindingTypeController ?? 'No binding type selected';
              String bookTypeValue =
                  bookTypeController ?? 'No book type selected';
              String tomeValue = tomeController.text;
              String pagesValue = pagesController.text;

              // Print values to console
              print('Name: $nameValue');
              print('Universe: $universeValue');
              print('Collection: $collectionValue');
              print('Editorial: $editorialValue');
              print('Binding Type: $bindingTypeValue');
              print('Book Type: $bookTypeValue');
              print('Tome: $tomeValue');
              print('Pages: $pagesValue');

              // TODO: Add logic to submit the form
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

// Generic textfield with validator
class MyTextField extends StatefulWidget {
  final String label;
  final bool validator;
  final TextEditingController controller;
  final bool numeric;
  const MyTextField({
    super.key,
    required this.label,
    this.validator = false,
    required this.controller,
    this.numeric = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: widget.numeric ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: TextStyle(color: Colors.pink[300]),
        filled: true,
        fillColor: Colors.grey[850],
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      // The validator receives the text that the user has entered.
      validator: widget.validator
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obligatorio';
              }
              return null;
            }
          : null,
    );
  }
}

// Universe dropdown menu
class UniverseDropdownMenuRow extends StatefulWidget {
  const UniverseDropdownMenuRow({super.key});

  @override
  State<UniverseDropdownMenuRow> createState() =>
      _UniverseDropdownMenuRowState();
}

TextEditingController universeController = TextEditingController();

class _UniverseDropdownMenuRowState extends State<UniverseDropdownMenuRow> {
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
            expandedInsets: EdgeInsets.zero,
            inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: Colors.pink[300],
              labelStyle: TextStyle(color: Colors.pink[300]),
              filled: true,
              fillColor: Colors.grey[850],
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            controller: universeController,
            label: const Text('Universo'),
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
        const SizedBox(width: 16.0),
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

// Collection dropdown menu
class CollectionDropdownMenuRow extends StatefulWidget {
  const CollectionDropdownMenuRow({super.key});

  @override
  State<CollectionDropdownMenuRow> createState() =>
      _CollectionDropdownMenuRowState();
}

TextEditingController collectionController = TextEditingController();

class _CollectionDropdownMenuRowState extends State<CollectionDropdownMenuRow> {
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
            expandedInsets: EdgeInsets.zero,
            inputDecorationTheme: InputDecorationTheme(
              suffixIconColor: Colors.pink[300],
              labelStyle: TextStyle(color: Colors.pink[300]),
              filled: true,
              fillColor: Colors.grey[850],
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            controller: collectionController,
            label: const Text('Colección'),
            onSelected: (collection) {
              setState(() {});
            },
            dropdownMenuEntries: library.keys
                .map<DropdownMenuEntry<String>>((String collection) {
              return DropdownMenuEntry<String>(
                value: collection,
                label: collection,
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 16.0),
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

// Editorial dropdown
class EditorialDropdownRow extends StatefulWidget {
  const EditorialDropdownRow({Key? key}) : super(key: key);

  @override
  State<EditorialDropdownRow> createState() => _EditorialDropdownRowState();
}

String? editorialController;

class _EditorialDropdownRowState extends State<EditorialDropdownRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('Editorial',
                      style: TextStyle(color: Colors.pink[300])),
                  iconEnabledColor: Colors.pink[300],
                  isExpanded: true,
                  value: editorialController,
                  onChanged: (newValue) {
                    if (newValue is String) {
                      setState(() {
                        editorialController = newValue;
                      });
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'Editorial 1',
                      child: Text('Editorial 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Editorial 2',
                      child: Text('Editorial 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Editorial 3',
                      child: Text('Editorial 3'),
                    ),
                    DropdownMenuItem(
                      value: 'Editorial 4',
                      child: Text('Editorial 4'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
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

// BindingType dropdown
class BindingTypeDropdown extends StatefulWidget {
  const BindingTypeDropdown({Key? key}) : super(key: key);

  @override
  State<BindingTypeDropdown> createState() => _BindingTypeDropdownState();
}

String? bindingTypeController;

class _BindingTypeDropdownState extends State<BindingTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('Tapa', style: TextStyle(color: Colors.pink[300])),
            iconEnabledColor: Colors.pink[300],
            isExpanded: true,
            value: bindingTypeController,
            onChanged: (newValue) {
              if (newValue is String) {
                setState(() {
                  bindingTypeController = newValue;
                });
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'Dura',
                child: Text('Dura'),
              ),
              DropdownMenuItem(
                value: 'Blanda',
                child: Text('Blanda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BookType dropdown
class BookTypeDropdown extends StatefulWidget {
  const BookTypeDropdown({super.key});

  @override
  State<BookTypeDropdown> createState() => _BookTypeDropdownState();
}

String? bookTypeController;

class _BookTypeDropdownState extends State<BookTypeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('Tipo', style: TextStyle(color: Colors.pink[300])),
            iconEnabledColor: Colors.pink[300],
            isExpanded: true,
            value: bookTypeController,
            onChanged: (newValue) {
              if (newValue is String) {
                setState(() {
                  bookTypeController = newValue;
                });
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'Libro',
                child: Text('Libro'),
              ),
              DropdownMenuItem(
                value: 'Comic',
                child: Text('Comic'),
              ),
              DropdownMenuItem(
                value: 'Guía',
                child: Text('Guía'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SelectMonth dropdown
class SelectMonthDropdown extends StatefulWidget {
  const SelectMonthDropdown({super.key});

  @override
  State<SelectMonthDropdown> createState() => _SelectMonthDropdownState();
}

String? selectMonthController;

class _SelectMonthDropdownState extends State<SelectMonthDropdown> {
  @override
  Widget build(BuildContext context) {
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('Mes', style: TextStyle(color: Colors.pink[300])),
            iconEnabledColor: Colors.pink[300],
            isExpanded: true,
            value: selectMonthController,
            onChanged: (newValue) {
              if (newValue is String) {
                setState(() {
                  selectMonthController = newValue;
                });
              }
            },
            items: months.map<DropdownMenuItem<String>>((String month) {
              return DropdownMenuItem<String>(
                value: month,
                child: Text(month),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// SelectYear dropdown
class SelectYearDropdown extends StatefulWidget {
  const SelectYearDropdown({super.key});

  @override
  State<SelectYearDropdown> createState() => _SelectYearDropdownState();
}

String? selectYearController;

class _SelectYearDropdownState extends State<SelectYearDropdown> {
  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    List<String> years =
        List.generate(21, (index) => (currentYear + index - 1).toString());

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('Año', style: TextStyle(color: Colors.pink[300])),
            iconEnabledColor: Colors.pink[300],
            isExpanded: true,
            value: selectYearController,
            onChanged: (newValue) {
              if (newValue is String) {
                setState(() {
                  selectYearController = newValue;
                });
              }
            },
            items: years.map<DropdownMenuItem<String>>((String years) {
              return DropdownMenuItem<String>(
                value: years,
                child: Text(years),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
