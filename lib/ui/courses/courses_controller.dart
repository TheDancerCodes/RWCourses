// Controller class to interact with the API
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/course_repository.dart';
import 'package:rwcourses/repository/repository.dart';

class CoursesController {

  // Private repository property
  final Repository _repository = CourseRepository();

  // Method to fetch courses ~ fetchCourses() method passes off the fetching of courses to the 
  // repository
  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}