import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:breaking_news/resources/values_manager.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {super.key, required this.onPressed, required this.svgImagePath});
  final Function onPressed;
  final String svgImagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: PaddingManager.pSocialBtnVPadding,
            horizontal: PaddingManager.pSocialBtnHPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(SizeManager.sBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onPrimary,
              blurRadius: SizeManager.sBlurRadius,
              offset: SizeManager.socialBtnShadowOffset,
            )
          ],
        ),
        child: SvgPicture.asset(
          svgImagePath,
          width: SizeManager.sIconSize,
          height: SizeManager.sIconSize,
        ),
      ),
    );
  }
}
