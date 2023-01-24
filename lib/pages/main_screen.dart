import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: const Text('Список дел'),
        centerTitle: true,

      ),
      body: Column(
        children: [
          const Text('Main Screen'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/todo'); // накладывает одну страницу на другую
              },
              child: const Text('Ркдакторовать список')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/todo', (rote) => false);// без стрелочки назад
              },
              child: const Text('Ркдакторовать список')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/todo');
              },
              child: const Text('Ркдакторовать список'))
        ],
      ),
    );
  }
}
