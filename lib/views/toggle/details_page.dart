import 'package:flutter/material.dart';
import 'package:hive_todo/utils/app_colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 80,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Todo List App',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Tentang Aplikasi:',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Aplikasi Todo List ini membantu Anda mengorganisir tugas harian dengan mudah. Fitur utama meliputi:',
              style: textTheme.bodyLarge,
            ),
            SizedBox(height: 15),
            _buildFeatureItem('• Menambah dan menghapus tugas'),
            _buildFeatureItem('• Menandai tugas yang sudah selesai'),
            _buildFeatureItem('• Menyimpan data secara lokal'),
            _buildFeatureItem('• Interface yang user-friendly'),
            SizedBox(height: 30),
            Text(
              'Versi: 1.0.0',
              style: textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}