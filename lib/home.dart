import 'package:flutter/material.dart';
import 'package:todo_list/database.dart';
import 'package:todo_list/dialogcontain/dialog_box.dart';
import 'package:todo_list/utility/todo_tile.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:todo_list/utility/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box('myBox');
  Database db = Database();

  @override
  void initState() {
    
    if(_myBox.get('TODOLIST')==null){
      db.firstOpen();
    }else{
      db.loadvalue();
    }


    super.initState();
  }

  // List toDoList = [
  //   ["sing a song", false],
  //   ["do dsa", true],
  //   ["do dsa", true],
  // ];

//check box true false block
  void checkBoxchanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      //print(toDoList[index][1]);
    });
   // db.updateData();//update value here
  }

  // save element block
  void saveTodo() {
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
      
    });
    Navigator.of(context).pop();
   // db.updateData(); //update value hetre
    
  }

  void onAddToDo() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            saveas: saveTodo,
            cancel: () => Navigator.of(context).pop(),
          );
        });
  }


//delete todo function using slidding pointer at todoTile
  void _deleteTodo(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    //db.updateData(); //update value here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 245, 157),
      appBar: AppBar(
        title: const Center(
          child: Text("To Do"),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddToDo,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Todotile(
            deleteTodo:(context) =>_deleteTodo(index) ,
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxchanged(value, index),
          );
        },
      ),
    );
  }
}
