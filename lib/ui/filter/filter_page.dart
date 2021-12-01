import 'package:flutter/material.dart';
import 'package:rwcourses/strings.dart';

// NOTE: For a StatefulWidget, we need to override createState()
class FilterPage extends StatefulWidget {
@override
  State<StatefulWidget> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.filter),
      ),
      body: Text('Filter'),
    );
  }
}