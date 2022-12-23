/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bluepad.png
  AssetGenImage get bluepad => const AssetGenImage('assets/icons/bluepad.png');

  /// File path: assets/icons/bluepen.png
  AssetGenImage get bluepen => const AssetGenImage('assets/icons/bluepen.png');

  /// File path: assets/icons/hashtagicon.png
  AssetGenImage get hashtagicon =>
      const AssetGenImage('assets/icons/hashtagicon.png');

  /// File path: assets/icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.png');

  /// File path: assets/icons/play-back.png
  AssetGenImage get playBack =>
      const AssetGenImage('assets/icons/play-back.png');

  /// File path: assets/icons/play-next.png
  AssetGenImage get playNext =>
      const AssetGenImage('assets/icons/play-next.png');

  /// File path: assets/icons/play.png
  AssetGenImage get play => const AssetGenImage('assets/icons/play.png');

  /// File path: assets/icons/repeat.png
  AssetGenImage get repeat => const AssetGenImage('assets/icons/repeat.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/w.png
  AssetGenImage get w => const AssetGenImage('assets/icons/w.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bluepad,
        bluepen,
        hashtagicon,
        icon,
        playBack,
        playNext,
        play,
        repeat,
        user,
        w
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/article_logo.png
  AssetGenImage get articleLogo =>
      const AssetGenImage('assets/images/article_logo.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/downCatArrow.png
  AssetGenImage get downCatArrow =>
      const AssetGenImage('assets/images/downCatArrow.png');

  /// File path: assets/images/padcast_logo.png
  AssetGenImage get padcastLogo =>
      const AssetGenImage('assets/images/padcast_logo.png');

  /// File path: assets/images/poster-test.jpg
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/images/poster-test.jpg');

  /// File path: assets/images/tech-bot-sad.svg
  SvgGenImage get techBotSad =>
      const SvgGenImage('assets/images/tech-bot-sad.svg');

  /// File path: assets/images/tech-bot.svg
  SvgGenImage get techBot => const SvgGenImage('assets/images/tech-bot.svg');

  /// File path: assets/images/techblog.png
  AssetGenImage get techblog =>
      const AssetGenImage('assets/images/techblog.png');

  /// List of all assets
  List<dynamic> get values => [
        articleLogo,
        avatar,
        downCatArrow,
        padcastLogo,
        posterTest,
        techBotSad,
        techBot,
        techblog
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
