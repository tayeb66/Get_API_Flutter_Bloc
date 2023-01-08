import 'dart:convert';

import 'package:get_api_flutter_bloc/Bloc/data_layer/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo{
  String url = "https://reqres.in/api/users?page=2";

  Future<List<Datum>> getUser() async{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];

      return result.map((e) => Datum.fromJson(e)).toList();
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}
