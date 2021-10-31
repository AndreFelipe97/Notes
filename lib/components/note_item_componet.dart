import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoteItemComponent extends StatelessWidget {
  final String note;
  final VoidCallback onTap;

  const NoteItemComponent({
    Key? key,
    required this.note,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note),
        onTap: onTap,
      ),
    );
  }
}
