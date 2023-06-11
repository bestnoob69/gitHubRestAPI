import '../models/posts.dart';
import 'package:http/http.dart' as http;

class HttpCall{
  Future<Post?> getPosts() async{
    var client = http.Client();

    var uri = Uri.parse('https://api.github.com/users/johndoe');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    }
  }
}