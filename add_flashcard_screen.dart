import 'package:flutter/material.dart';

class AddFlashcardScreen extends StatefulWidget {
  const AddFlashcardScreen({super.key});

  @override
  State<AddFlashcardScreen> createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade400,
          title: const Text(
        'Add Flashcard',style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration:  InputDecoration(
                labelText: 'Question:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 10)
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: answerController,
              decoration: InputDecoration(
                labelText: 'Answer:',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    answerController.text.isNotEmpty) {
                  // Return the new flashcard to the previous screen
                  Navigator.pop(context, {
                    'question': questionController.text,
                    'answer': answerController.text,
                  });
                }
              },
              child: const Text(
                'Add Flashcard',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
