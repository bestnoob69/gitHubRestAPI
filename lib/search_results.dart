import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:git_hub_search/services/http_call.dart';
import 'package:http/http.dart';

import 'models/posts.dart';

class UserDetials extends StatefulWidget {
  const UserDetials({Key? key}) : super(key: key);

  @override
  State<UserDetials> createState() => _UserDetialsState();
}

class _UserDetialsState extends State<UserDetials> {
  Post? posts;

  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getHttp();
  }
  void getHttp() async {
    // final response = await Dio().get('https://api.github.com/users/johndoe');
    // print(response);

    posts = (await HttpCall().getPosts());

    if(posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }
  // Future<void> main() async {
  //   List<Map<String, dynamic>> fetchData2 = await fetchData();
  //
  //   fetchData2.forEach((element) {
  //     print(element.runtimeType);
  //     print(element.keys);
  //     print(element.values);
  //   });
  //   print(fetchData2);
  // }
  // Future<List<Map<String, dynamic>>> fetchData() async {
  //   final response =
  //   await get(Uri.parse("https://api.wazirx.com/api/v2/tickers"));
  //
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> responseJson = json.decode(response.body);
  //     // print(responseJson.runtimeType);
  //     List<Map<String, dynamic>> list = [];
  //     var cd = responseJson.forEach((key, value) {
  //       Map<String, dynamic> value2 = Map.of({key: value});
  //       list.add(value2);
  //     });
  //
  //     return list;
  //   } else {
  //     throw Exception('Unexpected Error Occured!');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: CircularProgressIndicator(),

        child: ListView.builder(
            itemCount: 1,
            itemBuilder : (context,index){
            return Container(
                child: Text(posts!.nodeId),
            );

        }),
      ),

    );
  }
}
