import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomListTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      tileColor: Colors.grey[850],
      title: Text(
        widget.title,
        style: TextStyle(color: Colors.pink[300]),
      ),
      onTap: widget.onTap,
    );
  }
}
