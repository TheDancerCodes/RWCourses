import 'package:flutter/material.dart';
import 'package:rwcourses/strings.dart';
import 'package:rwcourses/ui/courses/courses_page.dart';

// App Widget
class RWCoursesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: CoursesPage(),
    );
  }
}
