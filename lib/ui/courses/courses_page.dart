import 'package:flutter/material.dart';
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/ui/course_detail/course_detail_page.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Our Course Page is a staeful widget
class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesPageState();
}

// The underscore(_) in the class name means that this class is private to this
// file.
class _CoursesPageState extends State<CoursesPage> {

  // Private Controller Property
  final _controller = CoursesController(CourseRepository());

  // Add a filter courses value
  int _filterValue = Constants.allFilter;

    // Add initState to call to loadValue
  // Calling the new loadValue() function from the initState() override for _CoursesPageState
  // SOLUTION: This lets is retrieve the currently saved filterValue that is in SharedPreferences 
  //when first loading the CoursesPage.
  @override
  void initState() {
    super.initState();
    _loadValue();
  }

    // Helper Method - to load the currently saved filter value when the
  // FilterPage is first opened
  // NOTE: The call to getInstance is asynchronous, we will use the
  // async/await keywords
  void _loadValue() async {
    final prefs = await SharedPreferences.getInstance();

    // Call setState and set the filterValue for the FilterPage.
    // We will set it using the current value for the filter that is stored in
    // SharedPreferences.
    // SOLUTION: We are calling getInt() on prefs, which is going to return an integer from 
    // SharedPreferences & we are passing in a key that the sharedPref for the filterValue is going 
    // to be saved under.
    setState(() {
      _filterValue = prefs.getInt(Constants.filterKey) ?? 0;
    });

  }



  @override
  Widget build(BuildContext context) {

    // Make calls from our controller. 
    //Return a Future Builder that handles the Future coming back from the controller
    // SOLUTION: In our Courses Controller, to fetch courses we pass the filterValue prperty so that 
    // we fetch courses for the currently selected filter
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(_filterValue),
      builder: (context, snapshot) {
        // NOTE: The snapshot will contain various states of teh future as it comes back.
        // For Now: Use data property of the snapshot to hold the list of courses
        var courses = snapshot.data;

        // Show progress indicator widget if courses that are returned are null, 
        //meaning snapshot data is null.
        if (courses == null) {
          return Center(child: CircularProgressIndicator());
        }
        
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: courses.length, // Length of the courses list
          itemBuilder: (BuildContext context, int position) {
            
            // Return a call to our _buildRow helper in this anonymous function
            // We are passing the courses and position to _buildRow
            return _buildRow(courses[position]);
          }
        );
      });
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(course.name, style: TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(course.domainString),
        trailing: Hero(
          tag: "cardArtwork-${course.courseId}",
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              course.artworkUrl,
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseDetailsPage(
                course: course,
              ),
            ),
          );
        }
      ),
    );
  }
}
