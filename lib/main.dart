import 'package:flutter/material.dart';
import 'package:list_view/animal_page.dart';

import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'bee',
    'cow',
    'deer',
    'elephant',
    'fox',
    'koala',
    'lion',
    'turtle',
  ];
  static List<String> animalImagePath = [
    'image/bee.png',
    'image/cow.png',
    'image/deer.png',
    'image/elephant.png',
    'image/fox.png',
    'image/koala.png',
    'image/lion.png',
    'image/turtle.png',
  ];
  static List<String> animalLocation = [
    'anywhere',
    'yard',
    'forest',
    'Africa',
    'Austrailia',
    'Austrailia',
    'Africa',
    'Sea',
  ];

  final List<Animal> animalData = List.generate(
      animalLocation.length,
      (index) => Animal(
          animalName[index], animalLocation[index], animalImagePath[index]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
          itemCount: animalData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  animalData[index].name,
                ),
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(animalData[index].imgPath),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AnimalPage(
                        animal: animalData[index],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
