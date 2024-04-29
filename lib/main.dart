import 'package:api_study/model.dart';
import 'package:api_study/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todos>? _listTodos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: (_listTodos == null)
            ? const CircularProgressIndicator()
            : TodosList(todos: _listTodos!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _listTodos = await TodoRepository().getTodos();
          setState(() {});
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({super.key, required this.todos});

  final List<Todos> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(todos[index].title),
          subtitle: Text('completed: ${todos[index].completed.toString()}'),
          leading: Text('id: ${todos[index].id.toString()}'),
          trailing: Text('userId: ${todos[index].userId.toString()}'),
        );
      },
    );
  }
}
