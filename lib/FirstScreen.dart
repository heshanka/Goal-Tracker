import 'package:flutter/material.dart';
import 'package:todo_app/screens/todolist.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      title: 'Goal Tracker',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 80.0),
                      child: GoalImageWidget()),
                      Text(
                        'Set your goals here',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Color(0xffb006400), fontStyle: FontStyle.italic,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 100.0, right: 8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0), ),
                            child: Text(
                              "Go to my list!",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            color: Color(0xffb74093),
                            textColor: Colors.white,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TodoList())),
                          ),
                        ),
                      )
                ],
              ),
            )),
      ),
    );
  }
}

class GoalImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage goalAsset = AssetImage('images/goal.png');
    Image image = Image(
      image: goalAsset,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}
