/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/apple.jpg
  AssetGenImage get apple => const AssetGenImage('assets/jpg/apple.jpg');

  /// File path: assets/jpg/banana.jpg
  AssetGenImage get banana => const AssetGenImage('assets/jpg/banana.jpg');

  /// File path: assets/jpg/berry.jpg
  AssetGenImage get berry => const AssetGenImage('assets/jpg/berry.jpg');

  /// File path: assets/jpg/coconut.jpg
  AssetGenImage get coconut => const AssetGenImage('assets/jpg/coconut.jpg');

  /// File path: assets/jpg/oppo.jpg
  AssetGenImage get oppo => const AssetGenImage('assets/jpg/oppo.jpg');

  /// File path: assets/jpg/pear.jpg
  AssetGenImage get pear => const AssetGenImage('assets/jpg/pear.jpg');

  /// File path: assets/jpg/profile.jpg
  AssetGenImage get profile => const AssetGenImage('assets/jpg/profile.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [apple, banana, berry, coconut, oppo, pear, profile];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/a1.png
  AssetGenImage get a1 => const AssetGenImage('assets/png/a1.png');

  /// File path: assets/png/a2.png
  AssetGenImage get a2 => const AssetGenImage('assets/png/a2.png');

  /// File path: assets/png/a4.png
  AssetGenImage get a4 => const AssetGenImage('assets/png/a4.png');

  /// File path: assets/png/a5.png
  AssetGenImage get a5 => const AssetGenImage('assets/png/a5.png');

  /// File path: assets/png/a6.png
  AssetGenImage get a6 => const AssetGenImage('assets/png/a6.png');

  /// File path: assets/png/a7.png
  AssetGenImage get a7 => const AssetGenImage('assets/png/a7.png');

  /// File path: assets/png/a8.png
  AssetGenImage get a8 => const AssetGenImage('assets/png/a8.png');

  /// List of all assets
  List<AssetGenImage> get values => [a1, a2, a4, a5, a6, a7, a8];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsPngGen png = $AssetsPngGen();
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
