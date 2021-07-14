import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';

// Our Course Page is a staeful widget
class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesPageState();
}

// The underscore(_) in the class name means that this class is private to this
// file.
class _CoursesPageState extends State<CoursesPage> {

  // Private controller Property
  final _controller = CoursesController();



  @override
  Widget build(BuildContext context) {

    // Make calls from our controller. 
    //Return a Future Builder that handles the Future coming back from the controller
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(Constants.allFilter),
      builder: (context, snapshot) {
        // NOTE: The snapshot will contain various states of teh future as it comes back.
        // For Now: Use data property of the snapshot to hold the list of courses
        var courses = snapshot.data;

        // Show progress indicator widget if courses that are returned are null, 
        //meaning snapshot data is null.
        if (courses == null) {
          return Center(child: CircularProgressIndicator());
        }
        
        return Text(courses.toString());
      });
  }
}
