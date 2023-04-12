import 'package:flutter/material.dart';

import 'src/common/theme.dart';
import 'src/views/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: AppTheme.light,
      home: const MainScreen(),
    );
  }
}
