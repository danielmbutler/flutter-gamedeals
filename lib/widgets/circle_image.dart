
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget{
  final String img;
  CircleImage(this.img);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: img,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )
          ),
        );
      },
      placeholder: (context, url)  {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

}