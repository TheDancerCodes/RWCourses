import 'package:flutter/material.dart';

// Our Course Page is a staeful widget
class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesPageState();
}

// The underscore(_) in the class name means that this class is private to this
// file.
class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Text('RWCourse');
  }
}
