import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/modals/login_model.dart';
import 'package:vidyalayas/modals/user_model.dart';
import 'package:vidyalayas/screens/edit_profile.dart';
import 'package:vidyalayas/services/api_services.dart';
import 'package:vidyalayas/user_preferences/user_preferences.dart';
import 'package:vidyalayas/widgets/about_container.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    final token =
        '0fcbV0&9CB&}C98D668e63bb2a4df08c707)80.1.9=9*2563e527fdb06c8358d';
    return Scaffold(
      backgroundColor: Palette.background.withOpacity(0.95),
      body: FutureBuilder(
          future: ApiServices.getUserInfo(token: token),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              UserModel data = snapshot.data;
              return Stack(
                children: [
                  Positioned(
                    top: size.height * 0.05,
                    child: Container(
                      width: size.width,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Palette.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Palette.black.withOpacity(0.25),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(4),
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/8124913/pexels-photo-8124913.jpeg?cs=srgb&dl=pexels-lina-lisitsyna-8124913.jpg&fm=jpg',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(data.data.school,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '',
                                    style: Style.BStyle,
                                  ),
                                ],
                              ),
                              Text(data.data.age,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 36,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Palette.purple,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.call,
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                    height: 36,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Palette.purple,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Icon(
                                      Icons.email,
                                      color: Palette.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Container(
                                      height: 36,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Palette.purple,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Palette.white,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileScreen()));
                                        },
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.33,
                    left: topSize - 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'About',
                          style: Style.BStyle,
                        ),
                        Text(
                          'Admin',
                          style: TextStyle(fontSize: 12),
                        ),
                        AboutContainer(
                          address: 'Biratnagar, Nepal',
                          phone: data.data.number,
                          email: data.data.email,
                          date: '2022-12-05 9:02',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.51,
                    left: topSize - 5,
                    child: Text('Activity', style: Style.BStyle),
                  ),
                  Positioned(
                    top: size.height * 0.55,
                    left: topSize - 5,
                    right: topSize - 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //list of events
                        ListTile(
                          minVerticalPadding: 10,
                          tileColor: Palette.white,
                          leading: Icon(CupertinoIcons.game_controller_solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text('Recommended Games'),
                          subtitle: Text(
                            'Games you might like',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(50, 30),
                                ),
                                child: Text('View'),
                                onPressed: () {}),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        ListTile(
                          tileColor: Palette.white,
                          leading: Icon(CupertinoIcons.game_controller_solid),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text('Featured Games'),
                          subtitle: Text(
                            'Have a look',
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(50, 30),
                                ),
                                child: Text('View'),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
