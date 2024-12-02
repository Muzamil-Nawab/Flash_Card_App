import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final List<Map<String, String>> flashcards;

  const QuizScreen({super.key, required this.flashcards});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  bool showAnswer = false;

  void nextFlashcard(bool correct) {
    if (correct) {
      score++;
    }
    setState(() {
      currentIndex++;
      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final flashcards = widget.flashcards;

    // Check if all flashcards are completed
    if (currentIndex >= flashcards.length) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade400,
          title: const Text(
            'Quiz Complete',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white), // Back button color to white
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Complete!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Score: $score/${flashcards.length}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      );
    }

    final flashcard = flashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade400, // AppBar color updated
        title: const Text('Quiz Mode', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white), // Back button color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentIndex + 1}/${flashcards.length}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              flashcard['question'] ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (showAnswer)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Answer: ${flashcard['answer']}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAnswer = true;
                });
              },
              child: const Text('Show Answer'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => nextFlashcard(true), // Correct answer
                  style: ElevatedButton.styleFrom(),
                  child: const Text('Correct'),
                ),
                ElevatedButton(
                  onPressed: () => nextFlashcard(false), // Incorrect answer
                  style: ElevatedButton.styleFrom(),
                  child: const Text('Incorrect'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
