import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RectangleImage extends StatelessWidget {
  final double? widthImg;
  final double? heightImg;
  final String? urlImg;
  final double? borderRadius;

  const RectangleImage(
      {Key? key,
      @required this.widthImg,
      @required this.heightImg,
      @required this.borderRadius,
      @required this.urlImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightImg,
      width: widthImg,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: urlImg ?? '',
          placeholder: (context, url) => widthImg == heightImg
              ? Image.asset("images/default_square.png", fit: BoxFit.fill)
              : Image.asset(
                  "images/default_rectangle_large.png",
                  fit: BoxFit.fill,
                ),
          errorWidget: (context, url, error) => widthImg == heightImg
              ? Image.asset("images/default_square.png", fit: BoxFit.fill)
              : Image.asset("images/default_rectangle_large.png",
                  fit: BoxFit.fill),
        ),
      ),
    );
  }
}
