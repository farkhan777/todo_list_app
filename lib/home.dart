import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
 _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ignore: deprecated_member_use
  List list = List();
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coursework"),
        backgroundColor: Color(0xffff5c62),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffff5c62),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext contex) {
                return AlertDialog(
                  title: Text("Add a new task", style: TextStyle(color: Color(0xffff5c62)),),
                  content: TextField(
                    onChanged: (String value){
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          list.add(input);
                        });
                      },
                      child: Text("Add"),
                      color: Color(0xffff5c62),
                      textColor: Colors.white,
                    ),
                  ],
                );
              },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext contex, int i) {
            return Dismissible(
                key: Key(list[i]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(15),
                  color: Color(0xffff5c62),
                  child: ListTile(
                    title: Text(
                      list[i],
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.remove_circle,
                        color: Color(0xffffffff),
                      ),
                      onPressed: () {
                        setState(() {
                          list.removeAt(i);
                        });
                      },
                    ),
                  ),
                ),
            );
          }
      ),
    );
  }
}