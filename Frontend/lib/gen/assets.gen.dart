/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/icons
  $LibAssetsIconsGen get icons => const $LibAssetsIconsGen();

  /// Directory path: lib/assets/images
  $LibAssetsImagesGen get images => const $LibAssetsImagesGen();
}

class $LibAssetsIconsGen {
  const $LibAssetsIconsGen();

  /// File path: lib/assets/icons/ai.png
  AssetGenImage get ai => const AssetGenImage('lib/assets/icons/ai.png');

  /// File path: lib/assets/icons/ai2.png
  AssetGenImage get ai2 => const AssetGenImage('lib/assets/icons/ai2.png');

  /// File path: lib/assets/icons/book.png
  AssetGenImage get book => const AssetGenImage('lib/assets/icons/book.png');

  /// File path: lib/assets/icons/booking.png
  AssetGenImage get booking =>
      const AssetGenImage('lib/assets/icons/booking.png');

  /// File path: lib/assets/icons/car.png
  AssetGenImage get car => const AssetGenImage('lib/assets/icons/car.png');

  /// File path: lib/assets/icons/forward.png
  AssetGenImage get forward =>
      const AssetGenImage('lib/assets/icons/forward.png');

  /// File path: lib/assets/icons/group.png
  AssetGenImage get group => const AssetGenImage('lib/assets/icons/group.png');

  /// File path: lib/assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('lib/assets/icons/home.png');

  /// File path: lib/assets/icons/hotel.png
  AssetGenImage get hotel => const AssetGenImage('lib/assets/icons/hotel.png');

  /// File path: lib/assets/icons/map.png
  AssetGenImage get map => const AssetGenImage('lib/assets/icons/map.png');

  /// File path: lib/assets/icons/place.png
  AssetGenImage get place => const AssetGenImage('lib/assets/icons/place.png');

  /// File path: lib/assets/icons/setting.png
  AssetGenImage get setting =>
      const AssetGenImage('lib/assets/icons/setting.png');

  /// File path: lib/assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('lib/assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ai,
        ai2,
        book,
        booking,
        car,
        forward,
        group,
        home,
        hotel,
        map,
        place,
        setting,
        user
      ];
}

class $LibAssetsImagesGen {
  const $LibAssetsImagesGen();

  /// File path: lib/assets/images/hotel1.jpg
  AssetGenImage get hotel1 =>
      const AssetGenImage('lib/assets/images/hotel1.jpg');

  /// File path: lib/assets/images/lalibela.jpg
  AssetGenImage get lalibela =>
      const AssetGenImage('lib/assets/images/lalibela.jpg');

  /// File path: lib/assets/images/lalibela1.jpg
  AssetGenImage get lalibela1 =>
      const AssetGenImage('lib/assets/images/lalibela1.jpg');

  /// File path: lib/assets/images/lalibela2.jpg
  AssetGenImage get lalibela2 =>
      const AssetGenImage('lib/assets/images/lalibela2.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [hotel1, lalibela, lalibela1, lalibela2];
}

class Assets {
  Assets._();

  static const $LibGen lib = $LibGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
