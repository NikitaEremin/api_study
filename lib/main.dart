import 'package:api_study/auth_screen.dart';
import 'package:api_study/model.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
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
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageView(
        children: [
          (_listTodos == null)
                ? const Center(child: CircularProgressIndicator())
                : TodosList(todoList: _listTodos!),
          AuthScreen(),
        ],


      ),

    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({super.key, required this.todoList});

  final List<Todos> todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(todoList[index].title),
            subtitle: Text('completed: ${todoList[index].completed.toString()}'),
            leading: Text('id: ${todoList[index].id.toString()}'),
            trailing: Text('userId: ${todoList[index].userId.toString()}'),
          );
        },
      ),
    );
  }
}
