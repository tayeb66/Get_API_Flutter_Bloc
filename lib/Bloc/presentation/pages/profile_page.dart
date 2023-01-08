import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage(
      {Key? key, this.firstName, this.lastName, this.imageUrl, this.email})
      : super(key: key);

  String? firstName;
  String? lastName;
  String? imageUrl;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("ProfilePage"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl.toString(),),
                      fit: BoxFit.cover

                    ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Name: ${firstName}",style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w800),),
            SizedBox(height: 10,),
            Text("Email: ${email}",style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800),)
          ],
        ),
      ),
    );
  }
}
