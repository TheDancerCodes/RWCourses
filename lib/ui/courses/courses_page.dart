import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/state/filter_state_container.dart';
import 'package:rwcourses/ui/course_detail/course_detail_page.dart';
import 'package:rwcourses/ui/courses/courses_controller.dart';

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

  // Instance of FilterState class to hold the currently selected filter value.
  FilterState state;

  // To set the value of the state property, add this method override
  // This connects the state of CoursesPage to the ingerited widget that's above it in the widget tree.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }



  @override
  Widget build(BuildContext context) {

    // Make calls from our controller. 
    //Return a Future Builder that handles the Future coming back from the controller
    // SOLUTION: In our Courses Controller, to fetch courses we pass the filterValue prperty so that 
    // we fetch courses for the currently selected filter
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(state.filterValue),
      builder: (context, snapshot) {
        // NOTE: The snapshot will contain various states of teh future as it comes back.
        // For Now: Use data property of the snapshot to hold the list of courses
        var courses = snapshot.data;

        // Show progress indicator widget if courses that are returned are null, 
        // meaning snapshot data is null.
        // Check the snapshot connectionState property -> continue to show a progress indicator 
        // if the connection state is not done.
        if (courses == null || 
        snapshot.connectionState != ConnectionState.done) {
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
