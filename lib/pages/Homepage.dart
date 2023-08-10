import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/database/database.dart';

import 'package:todo_list/utils/dialogue_box.dart';
import 'package:todo_list/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('mybox');
  tododatabase db = tododatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_mybox.get('TODOLIST') == null) {
      db.createointialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  // List Todolist = [
  //   ['make tuturoi', false],
  //   ['Excercise', false],
  // ];

  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.Todolist[index][1] = !db.Todolist[index][1];
    });
    db.updatedatebase();
  }

  void savenewtasl() {
    setState(() {
      db.Todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatebase();
  }

  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return dialogue_box(
          controller: _controller,
          onsave: savenewtasl,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.Todolist.removeAt(index);
    });
    db.updatedatebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.5),
      appBar: AppBar(
        elevation: 20,
        title: Text('Todo list App'),
      ),
      body: ListView.builder(
        itemCount: db.Todolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
            Taskname: db.Todolist[index][0],
            Taskcompleted: db.Todolist[index][1],
            onchanged: (value) => CheckboxChanged(value, index),
            deletefunction: (context) => deletetask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewtask,
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Todo List",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("todohelp@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
