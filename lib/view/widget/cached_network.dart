// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_plus/flutter_cached_network_image_plus.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final BoxFit? fit;
  final double? borderRadius;

  const CachedImage(
      {super.key,
      required this.imageUrl,
      this.fit,
      this.imageBuilder,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return CacheNetworkImagePlus(
      imageUrl: imageUrl,
      imageBuilder: imageBuilder,
      boxFit: fit ?? BoxFit.contain,
      borderRadius: borderRadius,
      errorWidget: const Center(
        child: Icon(
          Icons.broken_image_rounded,
          color: Colors.red,
        ),
      ),
    );
  }
}
