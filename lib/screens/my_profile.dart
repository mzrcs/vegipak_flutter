import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: const [
            Center(
              child: CircleAvatar(
                radius: 60, // Image radius
                backgroundImage:
                    NetworkImage('https://dummyimage.com/300/090.png/fff'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                "Salman Rasheed",
                style: TextStyle(fontFamily: 'Roboto', fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
