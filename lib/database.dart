import 'package:hive/hive.dart';

class Database{
  
List toDoList=[];

 final _myBox = Hive.box('myBox');

//first time opening the app Autostrore valaues are
  void  firstOpen(){
    toDoList=[
      ["delete by Sliding",false]
    ];
  }

// load database or get value into database

void loadvalue(){
  toDoList=_myBox.get('TODOLIST');
}

// //update the value like checkbox or on delete the element
void updateData(){
  _myBox.put('TODOLIST', toDoList);
}
}