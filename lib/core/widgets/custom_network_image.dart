import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/strings.dart';
import 'custom_error_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return SizedBox(
            height: 5,
            child: CircularProgressIndicator(
              color: AppColors.darkGreyColor,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return CustomErrorWidget(text: AppStrings.errorImageText);
        },
        imageUrl: imageUrl);
  }
}