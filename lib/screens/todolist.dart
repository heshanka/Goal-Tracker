import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/util/dbhelper.dart';
import 'package:todo_app/screens/tododetail.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Tracker'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffb74093),
      ),
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.pinkAccent,
        onPressed: () {
          navigateToDetail(Todo('', 3, ''));
        },
        tooltip: "Add new Todo",
        child: new Icon(Icons.add),
      ),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              radius: 15.0,
              backgroundColor: getColor(this.todos[position].priority),
              //child:Text(this.todos[position].priority.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].date),
            onTap: () {
              debugPrint("Tapped on " + this.todos[position].id.toString());
              navigateToDetail(this.todos[position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
      final todosFuture = helper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
        });
        debugPrint("Items " + count.toString());
      });
    });
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red[600];
        break;
      case 2:
        return Colors.yellow[400];
        break;
      case 3:
        return Colors.green[400];
        break;

      default:
        return Colors.green[400];
    }
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoDetail(todo)),
    );
    if (result == true) {
      getData();
    }
  }
}
