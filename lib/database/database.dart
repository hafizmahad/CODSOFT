
import 'package:hive_flutter/hive_flutter.dart';

class tododatabase{
  List Todolist=[];
  final _mybox= Hive.box('mybox');

// this will run when the App run first time
  void createointialdata(){
      Todolist = [
        ['Do exercise',false],
        ['Finish work',false],
      ];
  }

  // for dataloading
void loaddata(){
Todolist =_mybox.get('TODOLIST');
}
//update deta
void updatedatebase(){
_mybox.put('TODOLIST', Todolist);
}





}