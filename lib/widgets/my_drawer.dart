import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kode Mafia'),
            accountEmail: Text('kodemafia008@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.deepPurple
                  : Colors.white,
              backgroundImage: NetworkImage(
                  'https://scontent.fbir1-1.fna.fbcdn.net/v/t1.6435-9/217741995_1814456112093558_9056904957669744371_n.jpg?_nc_cat=102&ccb=1-4&_nc_sid=09cbfe&_nc_ohc=nuK1m11pvVYAX_LZKTk&_nc_ht=scontent.fbir1-1.fna&oh=3fea586e7bee98ce0b6cb8055cb10b9e&oe=613A7A9E'),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Students"),
            leading: Icon(CommunityMaterialIcons.account_outline),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Attendance"),
            leading: Icon(CommunityMaterialIcons.account_plus),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Assignment"),
            leading: Icon(Icons.add_task),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Student Fee"),
            leading: Icon(Icons.money_off_csred_sharp),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Staff"),
            leading: Icon(Icons.people),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Subjects"),
            leading: Icon(Icons.book),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Examinations"),
            leading: Icon(Icons.assignment),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text("Transport"),
            leading: Icon(Icons.bus_alert_rounded),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.close_fullscreen_outlined),
            title: Text("Close"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
