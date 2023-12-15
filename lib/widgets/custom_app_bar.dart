import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.pink[100],
      elevation: 4.0,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.pink[300],
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
      centerTitle: true,
    );
  }

  // add implementation to be able to custimize appbar widget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
