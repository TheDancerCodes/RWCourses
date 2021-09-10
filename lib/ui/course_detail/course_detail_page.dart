import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';

class CourseDetailsPage extends StatelessWidget {

  // Each CourseDetailPage is going to have a Course. Add a property for a Course.
  final Course course;

  // Constructor for the CourseDetailsPage
  // Since it is a StatelessWidget, we need to add a key parameter to the constructor
  CourseDetailsPage({Key key, this.course}) : super(key: key);

  // Each StatelessWidget needs to override the build method
  @override
  Widget build(BuildContext context) {
    // Scaffold that has an app bar and a body. 
    //The body for now has a text widget and some placeholder text.
    return Scaffold(
      appBar: AppBar(title: Text(course.name)), 
      body: Text('Course detail'),
    );
  }
}