import 'package:flutter/material.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/ui/course_detail/image_container.dart';
import 'package:rwcourses/utils/string_extensions.dart';

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
      body: Column( 
        // The body of the course details screen has a column that shows the banner, main info, 
        // and some more course details.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          _buildMain(context),
          _buildDetails(context,)
        ],
        )
    );
  }

  // Private method to build a banner using the Image Container class.
  Widget _buildBanner() {
    return ImageContainer(
      height: 200,
      url: course.artworkUrl,
    );
  }

  // buildMain() helper ~ to show the course title and course description in text widgets
  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            course.name,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 24),
          ),
          Text(
            course.description,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ],),
    );
  }

  // buildDetails() Helper Method ~ shows the course domains, difficulty and contributors.
  Widget _buildDetails(BuildContext context) {
    final style = TextStyle(fontSize: 16);

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '${course.contributors}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],

      ),
    );
  }

}