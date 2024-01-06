import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final BoxFit? fit;

  const CachedImage(
      {super.key, required this.imageUrl, this.fit, this.imageBuilder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      fit: fit ?? BoxFit.contain,
      // placeholder: (context, url) =>
      //     const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.broken_image_rounded,
          color: Colors.red,
        ),
      ),
    );
  }
}
