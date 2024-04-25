import 'package:flutter/material.dart';
import 'package:breaking_news/resources/image_manager.dart';

class ImageFromNetwork extends StatelessWidget {
  const ImageFromNetwork({
    super.key,
    required this.imagePath,
    this.fit,
    required this.height, required this.width,
  });

  final String imagePath;
  final double height;
  final double width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      fit: fit,
      height: height,
      width: width,
      errorBuilder:(context, error, stackTrace) {
        return Image.asset(ImageManager.splash, width: width,height: height,);
      }, 
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
