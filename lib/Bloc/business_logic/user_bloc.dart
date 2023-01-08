import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_flutter_bloc/Bloc/business_logic/user_event.dart';
import 'package:get_api_flutter_bloc/Bloc/business_logic/user_state.dart';
import 'package:get_api_flutter_bloc/Bloc/data_layer/models/user_model.dart';
import '../data_layer/repo/user_repo.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserRepo? userRepo;
  UserBloc({this.userRepo}) : super(UserLoadingState()){
    on<UserLoadingEvent>((event, emit)  async{
      emit(UserLoadingState());

      try{
        final userList = await userRepo?.getUser();
        emit(UserLoadedState(userList: userList));

      }catch(e){
        emit(UserErrorState(errorMsg: e.toString()));
      }
    });


  }
}