import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/note_item_componet.dart';
import 'components/widgets/appBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  _addNavigation() async {
    final description = await Navigator.pushNamed(context, "/create-note");
    if (description != null) {
      setState(() {
        notes.add(description as String);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: 'NOTES',
        actions: [IconButton(onPressed: _addNavigation, icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              NoteItemComponent(
                  note: notes[i],
                  onTap: () async {
                    final response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.removeAt(i);
                      } else {
                        notes[i] = description;
                      }
                      setState(() {});
                    }
                  }),
          ],
        ),
      ),
      // Botão floating
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: _addNavigation,
      // ),
    );
  }
}
