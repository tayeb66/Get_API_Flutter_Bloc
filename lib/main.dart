import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_flutter_bloc/Bloc/data_layer/repo/user_repo.dart';
import 'package:get_api_flutter_bloc/Bloc/presentation/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => UserRepo(),
        child: HomePage(),
      ),
    );
  }
}
