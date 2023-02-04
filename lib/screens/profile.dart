import 'package:advance_exam/model/jsonData.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../services/httpServices.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final HttpServices httpService = HttpServices();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register user data"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder<List<User>>(
              future: httpService.postUserApiResponse(),
              builder: (context, snapShot) {
                List<User> data = snapShot.data!;
                print(data);
                if (snapShot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              height: _height / 5,
                              child: ListTile(
                                leading: Text("${data[index].id!}"),
                                title: Text("${data[index].token}"),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder<List<JsonData>>(
              future: httpService.postJsonData(),
              builder: (context, snapShot) {
                List<JsonData> data = snapShot.data!;
                print(data);
                if (snapShot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              height: _height / 5,
                              child: ListTile(
                                leading: Text("${data[index].id!}"),
                                title: Text(data[index].title!),
                                subtitle: Text(data[index].body!),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
