/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsActivatedIconsGen {
  const $AssetsActivatedIconsGen();

  /// File path: assets/activated_icons/basket.svg
  String get basket => 'assets/activated_icons/basket.svg';

  /// File path: assets/activated_icons/home.svg
  String get home => 'assets/activated_icons/home.svg';

  /// File path: assets/activated_icons/my_account.svg
  String get myAccount => 'assets/activated_icons/my_account.svg';

  /// File path: assets/activated_icons/products.svg
  String get products => 'assets/activated_icons/products.svg';

  /// List of all assets
  List<String> get values => [basket, home, myAccount, products];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_icon.svg
  String get appleIcon => 'assets/images/apple_icon.svg';

  /// File path: assets/images/bottom_splash.svg
  String get bottomSplash => 'assets/images/bottom_splash.svg';

  /// File path: assets/images/checked.svg
  String get checked => 'assets/images/checked.svg';

  /// File path: assets/images/facebook_icon.svg
  String get facebookIcon => 'assets/images/facebook_icon.svg';

  /// File path: assets/images/feature_background.png
  AssetGenImage get featureBackground =>
      const AssetGenImage('assets/images/feature_background.png');

  /// File path: assets/images/featuredSVG.svg
  String get featuredSVG => 'assets/images/featuredSVG.svg';

  /// File path: assets/images/filter.svg
  String get filter => 'assets/images/filter.svg';

  /// File path: assets/images/filter2.svg
  String get filter2 => 'assets/images/filter2.svg';

  /// File path: assets/images/google_icon.svg
  String get googleIcon => 'assets/images/google_icon.svg';

  /// File path: assets/images/logo.svg
  String get logo => 'assets/images/logo.svg';

  /// File path: assets/images/notification_icon.svg
  String get notificationIcon => 'assets/images/notification_icon.svg';

  /// File path: assets/images/on_board1_background_image.svg
  String get onBoard1BackgroundImage =>
      'assets/images/on_board1_background_image.svg';

  /// File path: assets/images/on_board1_image.svg
  String get onBoard1Image => 'assets/images/on_board1_image.svg';

  /// File path: assets/images/on_board2_background_image.svg
  String get onBoard2BackgroundImage =>
      'assets/images/on_board2_background_image.svg';

  /// File path: assets/images/on_board2_image.svg
  String get onBoard2Image => 'assets/images/on_board2_image.svg';

  /// File path: assets/images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.png');

  /// File path: assets/images/search.svg
  String get search => 'assets/images/search.svg';

  /// File path: assets/images/splash.svg
  String get splash => 'assets/images/splash.svg';

  /// File path: assets/images/watermelon_test.png
  AssetGenImage get watermelonTest =>
      const AssetGenImage('assets/images/watermelon_test.png');

  /// List of all assets
  List<dynamic> get values => [
    appleIcon,
    bottomSplash,
    checked,
    facebookIcon,
    featureBackground,
    featuredSVG,
    filter,
    filter2,
    googleIcon,
    logo,
    notificationIcon,
    onBoard1BackgroundImage,
    onBoard1Image,
    onBoard2BackgroundImage,
    onBoard2Image,
    profileImage,
    search,
    splash,
    watermelonTest,
  ];
}

class $AssetsUnactivatedIconsGen {
  const $AssetsUnactivatedIconsGen();

  /// File path: assets/unactivated_icons/basket_unactivated.svg
  String get basketUnactivated =>
      'assets/unactivated_icons/basket_unactivated.svg';

  /// File path: assets/unactivated_icons/home_unactivated.svg
  String get homeUnactivated => 'assets/unactivated_icons/home_unactivated.svg';

  /// File path: assets/unactivated_icons/my_account_unactivated.svg
  String get myAccountUnactivated =>
      'assets/unactivated_icons/my_account_unactivated.svg';

  /// File path: assets/unactivated_icons/products_unactivated.svg
  String get productsUnactivated =>
      'assets/unactivated_icons/products_unactivated.svg';

  /// List of all assets
  List<String> get values => [
    basketUnactivated,
    homeUnactivated,
    myAccountUnactivated,
    productsUnactivated,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsActivatedIconsGen activatedIcons =
      $AssetsActivatedIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsUnactivatedIconsGen unactivatedIcons =
      $AssetsUnactivatedIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
