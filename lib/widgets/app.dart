import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reminding_notes/core/common/settings_service.dart';
import 'package:reminding_notes/core/notes/entities/note.dart';
import 'package:reminding_notes/infrastructure/common/generic_repository.dart';

import '../core/notes/services/notes_service.dart';
import 'common/settings_page.dart';
import 'common/models/settings_view_model.dart';
import 'notes/add_item_page.dart';
import 'notes/edit_item_page.dart';
import 'notes/notes_list_page.dart';

class App extends StatelessWidget {
  late GenericRepository<Note> scheduledNotesRepo;
  late GenericRepository<Note> dailyNotesRepo;
  late GenericRepository<Note> weeklyNotesRepo;
  late GenericRepository<Note> annualNotesRepo;

  App({Key? key}) : super(key: key) {
    scheduledNotesRepo = GenericRepository<Note>(boxNameAlias: 'scheduled');
    dailyNotesRepo = GenericRepository<Note>(boxNameAlias: 'daily');
    weeklyNotesRepo = GenericRepository<Note>(boxNameAlias: 'weekly');
    annualNotesRepo = GenericRepository<Note>(boxNameAlias: 'annual');
  }

  @override
  StatelessElement createElement() {
    scheduledNotesRepo.init();
    dailyNotesRepo.init();
    weeklyNotesRepo.init();
    annualNotesRepo.init();

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsViewModel>(
      create: (_) => SettingsViewModel(settingsService: SettingsService()),
      child: Consumer<SettingsViewModel>(
        builder: (_, model, __) {
          if (model.isFullScreen) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          } else {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
          }

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
            darkTheme: ThemeData.from(
              colorScheme: const ColorScheme.dark(
                primary: Colors.indigo,
                primaryVariant: Colors.indigo,
                secondary: Colors.cyan,
              ),
            ),
            themeMode: model.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => NotesListPage(
                    notesService: NotesService(
                      scheduledNotesRepo: scheduledNotesRepo,
                      dailyNotesRepo: dailyNotesRepo,
                      weeklyNotesRepo: weeklyNotesRepo,
                      annualNotesRepo: annualNotesRepo,
                    ),
                  ),
              '/editItem': (context) => const EditItemPage(),
              '/addItem': (context) => const AddItemPage(),
              '/settings': (_) => const SettingsPage(),
            },
          );
        },
      ),
    );
  }
}
