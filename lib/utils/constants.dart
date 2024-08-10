import 'package:flutter/material.dart';

class AppConstants {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  // API Endpoints
  static const String getPostsUrl = "$baseUrl";
  static const String getPostByIdUrl = "$baseUrl/"; // Append ID to this URL
  static const String createPostUrl = "$baseUrl";
  static const String updatePostUrl = "$baseUrl/"; // Append ID to this URL
  static const String deletePostUrl = "$baseUrl/"; // Append ID to this URL
}

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 18,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.grey,
  );
}

class AppColors {
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;
}
