// Concrete Implementation of Repository Interface


import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/course.dart';
import 'package:rwcourses/repository/repository.dart';

class CourseRepository implements Repository {

  // Data URL property ~ string representing the RW API that w're gonna call to.
  String dataURL = 
  "https://api.raywenderlich.com/api/contents?filter[content_types][]=collection";

  // Mark the getCourses() method as async because it returns a Future
  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    var courses = <Course>[];

    // Modify the URL incase there's a domain filter that the user wants to filter on
    var url = dataURL;

    // If domainFilter is not the allFilter, I will add on to the URL
    if(domainFilter != Constants.allFilter) {

      // Add another query filter onto the URL, this time on domain IDs & 
      // we use string interpolation to pass in the domain filter
      url += "&filter[domain_ids][]=$domainFilter";
    }

    return courses;
  }

}

