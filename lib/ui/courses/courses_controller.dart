// Controller class to interact with the API
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/repository.dart';

class CoursesController {

  // Private repository property
  final Repository _repository;

  // Constructor to set the repository property value. 
  // This lets us inject a repository into the controller. The controller is no longer aware of 
  // a specific type of repository & now it only knows about the repository interface.
  CoursesController(this._repository);

  // Method to fetch courses ~ fetchCourses() method passes off the fetching of courses to the 
  // repository
  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}