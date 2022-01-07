import 'package:flutter/material.dart';

Widget buildTaskItem(int numDays, String courseTitle, Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    height: 140,
    width: 140,
    decoration: BoxDecoration(
      color: Colors.pink.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deadline',
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text('$numDays days left',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 200,
          child: Text(courseTitle,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}

Widget buildTitleRow(String title, int number) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
          text: title,
          style:
              TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'RobBl'),
          children: [
            TextSpan(
              text: '($number)',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'RobM'),
            ),
          ],
        ),
      ),
      Text(
        'See all',
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff3e3993),
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget todayClassBrief(int time, String timeType, String subName,
    String location, String imageUrl, String tutorName, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 4),
    padding: EdgeInsets.all(10),
    height: 100,
    decoration: BoxDecoration(
      color: Color(0xfff9f9fb),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$time:00',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'AM',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          height: 100,
          width: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('The Basic of Typography II'),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Text(
                    tutorName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
