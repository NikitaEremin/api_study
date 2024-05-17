import 'package:api_study/repository.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CurrencyCoursesRepository().getCurrencies();
        },
        label: const Row(
          children: [Icon(Icons.download), Text('Загрузить курсы')],
        ),
      ),
      // body: ,
    );
  }
}
