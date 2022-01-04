import 'package:flutter/material.dart';

import 'infrastructure/initialize.dart';
import 'widgets/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeInfrastructure();

  runApp(App());
}
