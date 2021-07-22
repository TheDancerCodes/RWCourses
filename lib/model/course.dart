import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/domain.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  // Since all the parameters are marked as final, we need to add a constructor
  Course(
    this.courseId,
    this.name,
    this.description,
    this.artworkUrl,
    this.difficulty,
    this.contributors,
    this.domains,
  );

  /* Add fromJson() method ~ Takes one parameter which is a Map from String to dynamic
     To construct a Course object, we need to add a value for each of the properties;
     we pull this from the JSON. 
   */  
  Course.fromJson(Map<String, dynamic> json)
    : courseId = json["id"],
      name = json["attributes"]["name"],
      description = json["attributes"]["description_plain_text"],
      artworkUrl = json["attributes"]["card_artwork_url"],
      difficulty = json["attributes"]["difficulty"],
      contributors = json["attributes"]["contributor_string"],
      this.domains = [] {

        // Extract domain data from the JSON. Returns a list of dynamic types
        var domainData = json["relationships"]["domains"]["data"] as List<dynamic>;

        // If domain data is not null and if it has a length greater than zero, we loop over it and 
        // get a domain and add it to this course's domain list.
        if (domainData != null && domainData.length > 0) {
          for (var i = 0; i < domainData.length; i++) {
            
            // Pulled out the ID of the domain from the JSON and we're passing it into a 
            // getDomain() function.
            var domain = 
            Course.getDomain(json["relationships"]["domains"]["data"][i]["id"]);

            // Add the list of domains for the course
            domains.add(domain);
          }
        } 
      }

      static Domain getDomain(String domainId) {
        // Switch statement to switch on the domain ID that's passed into getDomain and 
        // return a domain.
        switch(domainId) {
          case Constants.iosDomain:
            return Domain.ios;

          case Constants.androidDomain:
            return Domain.android;

          case Constants.unityDomain:
            return Domain.unity;

          case Constants.sssDomain:
            return Domain.sss;

          case Constants.flutterDomain:
            return Domain.flutter;

          case Constants.macosDomain:
            return Domain.macos;

          case Constants.archivedDomain:
            return Domain.archived;
          
          default:
            return Domain.unknown;
        }
      }

      // Getter class for a domain string ~ to convert list of domains for the course 
      // into a string
      get domainString {
        String result = "";

        // Loop over the list of domains, stop right before the last one so that we could 
        // build up our results and add a comma after all those domains. 
        
        // And for the very last domain, add it at the very end, after our for loop.
        for (var i = 0; i < domains.length - 1; i++) {
          result += domains[i].name + ", ";
        }
        result += domains.last.name;
        return result;
      }

      // Add a toString() method inorder to see the response in the app.
      @override
  String toString() {
    return name + ": " + domainString;
  }
}