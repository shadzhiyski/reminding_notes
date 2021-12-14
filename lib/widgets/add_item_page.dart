import 'package:flutter/material.dart';

// TODO: continue implementation
class AddItemPage extends StatelessWidget {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextFormField(
              initialValue: 'Event Title',
              maxLength: 20,
              decoration: InputDecoration(
                icon: const Icon(Icons.edit_rounded),
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                helperText: 'Event title',
                suffixIcon: const Icon(
                  Icons.check_circle_rounded,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            TextFormField(
              initialValue: 'Event note',
              maxLength: 20,
              decoration: InputDecoration(
                icon: const Icon(Icons.edit_rounded),
                labelText: 'Note',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                helperText: 'Event note',
                suffixIcon: const Icon(
                  Icons.check_circle_rounded,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      );
}
