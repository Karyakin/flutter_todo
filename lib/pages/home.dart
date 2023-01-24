import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userTodo;
  List todoList = [];

  void _menuOpen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Меню'),
          ),
          body: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: const Text('На главную')),
              const Padding(padding: EdgeInsets.all(20)),
              const Text('Простое меню')
            ],
          ));
    }));
  }

  @override
  void initState() {
    super.initState();
    todoList.addAll(['Проснуться', 'Полежать', 'Сходить покакать', 'Покушать']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: const Text('Список дел'),
        centerTitle: true,
        actions: [IconButton(onPressed: _menuOpen, icon: const Icon(Icons.menu))],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon:
                        Icon(Icons.delete_sweep, color: Colors.deepPurple[800]),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                //if(direction == DismissDirection.endToStart)
                setState(() {
                  todoList.removeAt(index);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[800],
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Новое безделье'),
                  content: TextField(
                    onChanged: (String value) {
                      userTodo = value; // попробовать setstate
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoList.add(userTodo);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Подтверждаю'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.deepPurple[100],
        ),
      ),
    );
  }
}
