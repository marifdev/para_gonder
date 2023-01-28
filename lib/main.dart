import 'package:flutter/material.dart';
import 'package:para_gonder/features/invite/invite_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Para Gonder', //Can be localized for different languages with EasyLocalization
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InviteView(),
    );
  }
}
