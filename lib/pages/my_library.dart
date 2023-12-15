import 'package:book_tracking/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Mi biblioteca'),
      body: Column(
        children: [
          Center(
            child: Text('Pagina 3'),
          ),
        ],
      ),
    );
  }
}
