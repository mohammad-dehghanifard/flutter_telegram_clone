import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LoadNetworkImage extends StatelessWidget {
  const LoadNetworkImage({
    super.key, required this.imageUrl,this.radius = 12.0
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) {
          return Image.asset("assets/images/profile.png");
        },
      ),
    );
  }
}