// Repository Interface

import 'package:rwcourses/model/course.dart';

abstract class Repository {

// This function returns a Future list of Courses.
// getCourses takes one parameter, a domain filter, which lets the user select the domain that they want to see courses for.
Future<List<Course>> getCourses(int domainFilter);

}