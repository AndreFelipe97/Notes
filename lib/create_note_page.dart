import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/widgets/appBar.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        setState(() {
          isEdit = true;
        });
      }
    });
    super.initState();
  }

  _addDescription(value) {
    setState(() {
      description = value;
    });
  }

  _saveNote() {
    return Navigator.pop(context, description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titleText: isEdit ? "Edit Note" : "Create Note",
        actions: [
          if (isEdit)
            IconButton(
                onPressed: () {
                  Navigator.pop(context, "");
                },
                icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: null,
              onChanged: _addDescription,
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            SizedBox(
              height: 32,
            ),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 250,
                      child: ElevatedButton(
                          onPressed: _saveNote, child: Text('Salvar'))),
                ],
              )
          ],
        ),
      ),
    );
  }
}
