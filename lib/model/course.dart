class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;

  // Since all the parameters are marked as final, we need to add a constructor
  Course(
    this.courseId,
    this.name,
    this.description,
    this.artworkUrl,
    this.difficulty,
    this.contributors,
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
      contributors = json["attributes"]["contributor_string"];

      // Add a toString() method inorder to see the response in the app.
      @override
  String toString() {
    return name + ": " + difficulty;
  }
}