import 'package:flashcard_app/widgets/flashcard_widgets.dart';
import 'package:flutter/material.dart';
import 'add_flashcard_screen.dart';
import 'quiz_screen.dart';


class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {

  // this list for adding the our flashcard question and answer
  final List<Map<String, String>> flashcards = [
    {'question': 'Who is Quid e Azam?', 'answer': 'Quid e Azam was a Lawyer'},
    {'question': 'Who is the founder of Pakistan?', 'answer': 'Quid e Azam is the Founder of Pakistan'},
    {'question': 'what is the independence date of Pakistan', 'answer': '14 August 1947'},
  ];

// this list for our flashcard colors
  final List<Color> cardColors = [
    Colors.pink.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade400,
        title: const Text('Flashcard App',style: TextStyle(color: Colors.white),),
        actions: [

          // this icon button button we can use for navigate the flashcard screen to add flashcard screen and we use if staement and setstate
          IconButton(
            icon: const Icon(Icons.add_box_outlined,color: Colors.white,),
            onPressed: () async {
              final newFlashcard = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddFlashcardScreen()),
              );
              if (newFlashcard != null) {
                setState(() {
                  flashcards.add(newFlashcard);
                });
              }
            },
          ),

          // this icon button button we can use for navigate the add flashcard screen to quiz screen
          IconButton(
            icon: const Icon(Icons.quiz_outlined,color: Colors.white,),
            onPressed: () {
              if (flashcards.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(flashcards: flashcards),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add flashcards to start the quiz!')),
                );
              }
            },
          ),
        ],
      ),
      body: flashcards.isEmpty
          ? const Center(child: Text('No flashcards added yet!'))
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return FlashcardWidget(
                  question: flashcards[index]['question'] ?? '',
                  answer: flashcards[index]['answer'] ?? '',
                  color: cardColors[index % cardColors.length],
                  onDelete: () {
                    setState(() {
                      flashcards.removeAt(index);
                    });
                  },
                );
              },
            ),
    );
  }
}
