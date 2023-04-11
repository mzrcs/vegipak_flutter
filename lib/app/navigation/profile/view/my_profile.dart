import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegipak/app/navigation/profile/provider/profile_provider.dart';
import 'package:vegipak/widgets/button_widget.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
            bottom: MediaQuery.of(context).size.height * 0.03,
          ),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 60, // Image radius
                  backgroundImage:
                      NetworkImage('https://dummyimage.com/300/090.png/fff'),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Salman Rasheed",
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 22),
                ),
              ),
              const Spacer(),
              Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: myButton(
                      'Logout',
                      () {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .logOut(context);
                      },
                      loading: value.isLoading,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
