import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/extension/space_exs.dart';
import 'package:hive_todo/utils/app_colors.dart';
import 'package:hive_todo/views/home/home_view.dart';
import 'package:hive_todo/views/toggle/details_page.dart';
import 'package:hive_todo/views/toggle/profile_page.dart';
import 'package:hive_todo/views/toggle/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  // Icon
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  // Text
  final List<String> texts = ["Home", "Profile", "Settings", "Details"];

  // Pages
  final List<Widget> pages = [
    HomeView(), // Ganti dengan nama class HomeView yang sesuai
    ProfilePage(),
    SettingsPage(),
    DetailsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 90),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.primaryGradientColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://avatars.githubusercontent.com/u/91388754?v=4",
            ),
          ),
          8.h,
          Text('Sole', style: textTheme.displayMedium),
          Text('Flutter Dev', style: textTheme.displaySmall),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    log('${texts[index]} Item Tapped!');
                    Navigator.pop(context); // Tutup drawer
                    
                    if (index == 0) {
                      // Home - kembali ke home (pop all routes)
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                        (route) => false,
                      );
                    } else {
                      // Navigate ke halaman lain
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pages[index]),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(3),
                    child: ListTile(
                      leading: Icon(
                        icons[index],
                        color: Colors.white,
                        size: 30,
                      ),
                      title: Text(
                        texts[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_todo/extension/space_exs.dart';
// import 'package:hive_todo/utils/app_colors.dart';

// class CustomDrawer extends StatelessWidget {
//   CustomDrawer({super.key});

//   // Icon
//   final List<IconData> icons = [
//     CupertinoIcons.home,
//     CupertinoIcons.person_fill,
//     CupertinoIcons.settings,
//     CupertinoIcons.info_circle_fill,
//   ];

//   // Text
//   final List<String> texts = ["Home", "Profile", "Settings", "Details"];

//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme;
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 90),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: AppColors.primaryGradientColor,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(
//               "https://avatars.githubusercontent.com/u/91388754?v=4",
//             ),
//           ),
//           8.h,
//           Text('Sole', style: textTheme.displayMedium),
//           Text('Fluter Dev', style: textTheme.displaySmall),
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//             width: double.infinity,
//             height: 300,
//             child: ListView.builder(
//               itemCount: icons.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return InkWell(
//                   onTap: () {
//                     log('${texts[index]} Item Tapped!');
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(3),
//                     child: ListTile(
//                       leading: Icon(
//                         icons[index],
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                       title: Text(
//                         texts[index],
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
