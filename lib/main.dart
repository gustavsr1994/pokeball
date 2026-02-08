import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokeball/core/config/di/injection.dart' as di;

import 'app/presentation/pages/home_page.dart';
import 'core/utils/styles/app_text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        extensions: [
          AppTextStyles(
            small: const TextStyle(fontSize: 12),
            normal: const TextStyle(fontSize: 14),
            medium: const TextStyle(fontSize: 16),
            large: const TextStyle(fontSize: 20),
          ),
        ],
      ),
      home: HomePage(pageController: GetIt.I.get()),
    );
  }
}
