/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
  AssetGenImage get hotelPng =>
      const AssetGenImage('lib/assets/icons/hotel.png');

  /// File path: lib/assets/icons/hotel.svg
  SvgGenImage get hotelSvg => const SvgGenImage('lib/assets/icons/hotel.svg');

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
  List<dynamic> get values => [
        ai,
        ai2,
        book,
        booking,
        car,
        forward,
        group,
        home,
        hotelPng,
        hotelSvg,
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

  /// List of all assets
  List<AssetGenImage> get values => [hotel1, lalibela];
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
