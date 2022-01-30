import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String url;
  const PostContainer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
