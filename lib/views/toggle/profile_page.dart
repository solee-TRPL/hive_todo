import 'package:flutter/material.dart';
import 'package:hive_todo/extension/space_exs.dart';
import 'package:hive_todo/utils/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            50.h,
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/91388754?v=4",
              ),
            ),
            30.h,
            Text(
              'Sole',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.h,
            Text(
              'Flutter Developer',
              style: textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            20.h,
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.email, color: AppColors.primaryColor),
                  15.w,
                  Text(
                    'sole@example.com',
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}