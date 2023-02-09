/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:besmkallahom/core/util/resources/translation_manager.dart';
import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/antonio-Regular.ttf
  String get antonioRegular => 'assets/fonts/antonio-Regular.ttf';

  /// File path: assets/fonts/nunito-Medium.ttf
  String get nunitoMedium => 'assets/fonts/nunito-Medium.ttf';

  /// File path: assets/fonts/poppins-Light.ttf
  String get poppinsLight => 'assets/fonts/poppins-Light.ttf';

  /// File path: assets/fonts/tajawal-Regular.ttf
  String get tajawalRegular => 'assets/fonts/tajawal-Regular.ttf';

  /// File path: assets/fonts/othmani.ttf
  String get othmani => 'assets/fonts/othmani.ttf';

  /// List of all assets
  List<String> get values =>
      [othmani, antonioRegular, nunitoMedium, poppinsLight, tajawalRegular];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLottiGen get lotti => const $AssetsImagesLottiGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/new_json.json
  String get newJson => 'assets/json/new_json.json';

  /// List of all assets
  List<String> get values => [newJson];
}

///Lottie
class $AssetsImagesLottiGen {
  const $AssetsImagesLottiGen();

  /// File path: assets/images/lottie/loading
  String get loading => 'assets/images/lottie/loading.json';

  /// List of all assets
  List<String> get values => [loading];
}

///PNG
class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/surah_card
  String get surahCard => 'assets/images/png/surah_card.png';

  /// List of all assets
  List<String> get values => [surahCard,];
}

///SVG
class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/arrowBack
  String get arrowBack => 'assets/images/svg/arrow_back.svg';

  /// File path: assets/images/svg/icon
  String get icon => 'assets/images/svg/icon.svg';

  /// File path: assets/images/svg/background
  String get background => 'assets/images/svg/background.svg';

  /// File path: assets/images/svg/home
  String get home => 'assets/images/svg/home.svg';

  /// File path: assets/images/svg/book
  String get book => 'assets/images/svg/book.svg';

  /// File path: assets/images/svg/starBook
  String get starBook => 'assets/images/svg/star_book.svg';

  /// File path: assets/images/svg/donition
  String get donition => 'assets/images/svg/donition.svg';

  /// File path: assets/images/svg/morningButton
  String get morningButton => 'assets/images/svg/morning_button.svg';

  /// File path: assets/images/svg/eveningButton
  String get eveningButton => 'assets/images/svg/evening_button.svg';

  /// File path: assets/images/svg/tasbeh
  String get tasbeh => 'assets/images/svg/tasbeh.svg';

  /// File path: assets/images/svg/slah
  String get slah => 'assets/images/svg/slah.svg';

  /// File path: assets/images/svg/quran_card
  String get quranCard => 'assets/images/svg/quran_card.svg';

  /// File path: assets/images/svg/mark
  String get mark => 'assets/images/svg/mark.svg';

  /// List of all assets
  List<String> get values => [
        arrowBack,
        icon,
        background,
        donition,
        home,
        starBook,
        book,
        eveningButton,
        morningButton,
        tasbeh,
        slah,
        quranCard,
        mark
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
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

class LanguageManager {
  static String lang = 'ar';
  static late TranslationModel translationModel;
}
