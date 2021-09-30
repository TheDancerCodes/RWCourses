import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {

  // URL of the image we want to load
  final double width;
  final double height;
  final Color placeholder;
  final String url;

  // Constructor to set the properties above
  // In the constructor we pass a key because this is a stateless widget
  const ImageContainer(
    {Key key,
    this.width,
    this.height,
    this.placeholder = const Color(0xFFEEEEEE), // default placeholder color
    @required this.url})
    : super(key: key);

    /*
     * Build method for the widget
     * BoxDecoration is a way to draw a box, it uses the placeholder color as a background
     * which will show while the image is downloading. 
     * 
     * The box is drawn in layers and the color is the bottom-most layer. 
     * 
     * The image of a BoxDecoration shows on top of the color and has an alignment controlled 
     * by a decoration image.
     * 
     * NOTE: You can use the decoration image to control how the image fits inside the box, 
     * and here we are using the default settings. */
    @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: placeholder,
        image: url.contains("http")
        ? DecorationImage(image: NetworkImage(url))
        : null),
    );
  }
}