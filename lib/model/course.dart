class Course {
  final String courseId;
  final String name;
  final String description;

  // Since all the parameters are marked as final, we need to add a constructor
  Course(
    this.courseId,
    this.name,
    this.description,
  );
}