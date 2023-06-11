import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_hub_search/main2.dart';
import 'package:git_hub_search/search_results.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
  }

  var data =[];
  bool isLoading = true;
  final TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHubSearch'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: username,
              decoration: InputDecoration(
                hintText: 'Enter a username',
                suffixIcon: IconButton(icon: Icon(Icons.clear),onPressed: () => username.clear(),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),

              ),
            ),
            // SizedBox(height: 20,),
            // Expanded(
            //   child: ListView.builder(
            //
            //       itemCount: data.length,
            //       itemBuilder: (BuildContext context,int index){
            //       return ListTile(
            //           leading: CircleAvatar(
            //             child: Image.network(data[index]['avatar_url']),
            //           ),
            //           title: Text(
            //             'Sonit',
            //             style: TextStyle(
            //               color: Colors.blue,
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //
            //           ),
            //         subtitle: Text(data[index]['url']),
            //         trailing: Icon(Icons.arrow_right),
            //       );
            //   }),
            // ),


            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home()
              ));
            }

              , child: Text('Search'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
            ),
          ],
        ),
      ),

    );
  }
  void getJsonData() async{
    var response = await http.get(Uri.https('https://api.github.com/users/johndoe31415'));
    setState(() {
      isLoading = false;
      data = json.decode(response.body);
    });

  }
}

