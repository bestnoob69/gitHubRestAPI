import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:git_hub_search/models/repo.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

Future<Post?> fetchRepos() async {
  final response = await http.get(Uri.http('https://api.github.com/users/johndoe31415'));
  if(response.statusCode == 200){
    print(response.body);
    return Post.fromJson(json.decode(response.body));
  }
  else throw Exception('Failed to fetch details');

}
class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRepos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github API'),
      ),
      body: Center(child: Text('Body'),),
    );
  }
}

