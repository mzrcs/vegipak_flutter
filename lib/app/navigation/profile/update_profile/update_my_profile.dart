import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/profile_provider.dart';

class UpdateMyProfile extends StatefulWidget {
  const UpdateMyProfile({super.key});

  @override
  State<UpdateMyProfile> createState() => _UpdateMyProfileState();
}

class _UpdateMyProfileState extends State<UpdateMyProfile> {
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   ((timeStamp) {
    //     Provider.of<ProfileProvider>(context, listen: false).getSavedData();
    //   }),
    // );

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProfileProvider>(
        builder: (context, value, _) {
          // print(value.email);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text('Email', style: TextStyle(color: Colors.black)),
                  // value.email != null
                  //     ? Text(value.email.toString())
                  //     : const SizedBox(),
                  const SizedBox(height: 12),
                  // name input field
                  TextFormField(
                    initialValue: value.email,
                    validator: (val) =>
                        val != null && val.isNotEmpty ? null : 'Required Field',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'example@gmail.com',
                      label: const Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
