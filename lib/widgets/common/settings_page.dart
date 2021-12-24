import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_view_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Consumer<SettingsViewModel>(
          builder: (_, model, __) => Column(
            children: [
              PopupMenuItem(
                child: SwitchListTile(
                  title: const Text('Full Screen'),
                  value: model.isFullScreen,
                  onChanged: (value) => model.isFullScreen = value,
                  secondary: Icon(
                    !model.isFullScreen
                        ? Icons.fullscreen
                        : Icons.fullscreen_exit,
                  ),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: model.isDarkMode,
                  onChanged: (value) => model.themeMode =
                      value ? ThemeMode.dark : ThemeMode.light,
                  secondary: Icon(
                    model.isDarkMode ? Icons.brightness_4 : Icons.brightness_2,
                  ),
                ),
                value: 2,
              ),
            ],
          ),
        ),
      );
}
