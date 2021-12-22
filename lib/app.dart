import 'package:flutter/material.dart';

import 'core/notes/services/notes_service.dart';
import 'widgets/notes/add_item_page.dart';
import 'widgets/notes/edit_item_page.dart';
import 'widgets/notes/notes_list_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminding Notes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(
          primary: Colors.indigo,
          primaryVariant: Colors.indigo,
          secondary: Colors.cyan,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {
          return NotesListPage(notesService: NotesService());
        },
        '/editItem': (context) {
          return const EditItemPage();
        },
        '/addItem': (context) {
          return const AddItemPage();
        },
      },
    );
  }
}
