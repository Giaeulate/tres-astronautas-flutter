import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tres_astronauntas_demo/widgets/custom_loading.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double width;
  final double? height;
  final bool circle;
  const CustomImage(
    this.image, {
    Key? key,
    this.width = 70,
    this.height,
    this.circle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == null
        ? const Icon(Icons.error)
        : circle
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: image!,
                  width: width,
                  height: height,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CustomLoading(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            : CachedNetworkImage(
                imageUrl: image!,
                width: width,
                height: height,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const CustomLoading(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
  }
}
