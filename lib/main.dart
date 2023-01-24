import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

List<String> findUniqueWords(String text) {
  final uniqueWords = <String>{};
  final wordMatch = RegExp(
    r'([\p{Letter}\u202f\u180B\u180C\u180D\u180E-]+)',
    unicode: true,
  );
  final matches = wordMatch.allMatches(text);
  for (final match in matches) {
    final word = match.group(1);
    if (word != null) {
      uniqueWords.add(word);
    }
  }
  return uniqueWords.toList()..sort();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                controller: controller,
                autofocus: true,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final words = findUniqueWords(controller.text);
                controller.text = words.toString();
                debugPrint(words.toString());
              },
              child: const Text('Find unique words'),
            ),
          )
        ]),
      ),
    );
  }
}
