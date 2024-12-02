
import 'package:flashcard_app/widgets/screen/flashcard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FlashcardApp());
}

class FlashcardApp extends StatelessWidget {
  const FlashcardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashcard App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlashcardScreen(),
    );
  }
}
