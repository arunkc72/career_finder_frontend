import 'dart:convert';

import 'package:career_finder/Utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Utils/appbar.dart';
import '../Utils/bottomnavbar.dart';
import '../Utils/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUniversity();
  }

  var University = [];
  bool loading = true;
  String error = '';

  getUniversity() async {
    var response;
    try {
      setState(() {
        loading = true;
      });
      var body = jsonEncode({"global_score": 5, "enrollment": 1});
      // var headers = {"Content-type": "application/json"};
      // var uri = Uri.parse('http://127.0.0.1:5000//universities');
      response = await http.post(
        Uri.parse('http://localhost:5000/universities'),
        headers: {
          "Content-type": "application/json",
        },
        body: body,
      );
      print("The response status is ");
      print(response.statusCode);
      setState(() {
        print(response);
        University = jsonDecode(response.body.toString());
        loading = false;
      });
      print(University);
    } catch (e) {
      setState(() {
        print('error');
        print(e);
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(title: 'Career Finder'),
      body: loading == true
          ? Center(
              child: Text("Generating university list using AI"),
            )
          : Container(
              color: mybackgroundcolor,
              height: 500,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      tileColor: Colors.white,
                      title: Text("${University[index]['University_Name']}"),
                      subtitle: Text("${University[index]['City']}"),
                    );
                  }),
            ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
