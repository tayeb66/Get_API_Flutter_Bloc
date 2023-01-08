import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_flutter_bloc/Bloc/business_logic/user_bloc.dart';
import 'package:get_api_flutter_bloc/Bloc/business_logic/user_event.dart';
import 'package:get_api_flutter_bloc/Bloc/business_logic/user_state.dart';
import 'package:get_api_flutter_bloc/Bloc/data_layer/models/user_model.dart';
import 'package:get_api_flutter_bloc/Bloc/data_layer/repo/user_repo.dart';
import 'package:get_api_flutter_bloc/Bloc/presentation/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        userRepo: RepositoryProvider.of<UserRepo>(context),
      )..add(UserLoadingEvent()),
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("UserList"),
          centerTitle: true,
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<Datum>? userList1 = state.userList;
              return ListView.builder(
                itemCount: userList1!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                    firstName: userList1[index]
                                            .firstName
                                            .toString() +
                                        " " +
                                        userList1[index].lastName.toString(),
                                    email: userList1[index].email.toString(),
                                    imageUrl:
                                        userList1[index].avatar.toString(),
                                  )));
                    },
                    child: Card(
                      color: Colors.black45,
                      elevation: 0.0,
                      child: ListTile(
                        title: Text(
                            userList1[index].firstName.toString() +
                                " " +
                                userList1[index].lastName.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(userList1[index].email.toString(),style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400),),
                        trailing: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList1[index].avatar.toString()),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserErrorState) {
                  return Container(
                    child: Center(
                      child: Text(state.errorMsg.toString()),
                    ),
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
