// Concrete Implementation of Repository Interface

import 'dart:convert';

import 'package:http/http.dart' as http;
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

    // Make a call to the HTTP get() method.
    // We are passing the URL we calculated to the http.get() method, and it returns a response.
    // The call is asynchronous ~ we need to use the 'await' keyword
    http.Response response = await http.get(url);

    // Decode the response
    final apiResponse = json.decode(response.body);

    // Pull out data objects & add a map call to map the json inside of data. 
    // And for each course json object we're going to call fromJson() & add it to our courses list
    apiResponse["data"].map((json) {
      courses.add(Course.fromJson(json));
    }).toList();

    return courses;
  }

}

