import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import '../../generated/l10n.dart';
import '../../resources/image_manager.dart';
import 'elevated_button.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget(
      {super.key, required this.errorMessage, required this.onTap});

  final String errorMessage;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    late GifController gifController;
    gifController = GifController(
        onFrame: (value) => value == 24 ? gifController.pause() : null);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Spacer(),
          Text(errorMessage, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(
            height: 15,
          ),
          GifView.asset(
            ImageManager.noConnection,
            controller: gifController,
            height: 300,
            width: 300,
            frameRate: 30, // default is 15 FPS
          ),
          const SizedBox(
            height: 20,
          ),
          MyElevatedButton(
            onPress: () => onTap(),
            title: S.current.retry,
          ),
        ]);
  }
}
