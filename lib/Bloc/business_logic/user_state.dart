import 'package:equatable/equatable.dart';

import '../data_layer/models/user_model.dart';

abstract class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoadingState extends UserState{}

class UserLoadedState extends UserState{
  UserLoadedState({this.userList});

  final List<Datum>? userList;

  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}

class UserErrorState extends UserState{
  String? errorMsg;
  UserErrorState({this.errorMsg});
}