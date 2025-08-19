import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/shared_preferences_service.dart';

class FontSizeController extends GetxController {
  // Reactive variables
  final RxDouble _fontSize = AppConstants.materialFontSizeDefault.obs;
  final RxBool _isOverlayVisible = false.obs;

  // Getters
  double get fontSize => _fontSize.value;
  bool get isOverlayVisible => _isOverlayVisible.value;

  // Font size limits and step
  static const double fontSizeStep = 2.0;

  @override
  void onInit() {
    super.onInit();
    _loadFontSize();
  }

  // Load font size from SharedPreferences
  void _loadFontSize() {
    final savedFontSize = SharedPreferencesService.getFontSize();
    _fontSize.value = savedFontSize.clamp(
      AppConstants.materialFontSizeMin,
      AppConstants.materialFontSizeMax,
    );
  }

  // Save font size to SharedPreferences
  Future<void> _saveFontSize() async {
    await SharedPreferencesService.setFontSize(_fontSize.value);
  }

  // Methods
  void increaseFontSize() {
    if (_fontSize.value < AppConstants.materialFontSizeMax) {
      _fontSize.value = (_fontSize.value + fontSizeStep).clamp(
        AppConstants.materialFontSizeMin,
        AppConstants.materialFontSizeMax,
      );
      _saveFontSize();
    }
  }

  void decreaseFontSize() {
    if (_fontSize.value > AppConstants.materialFontSizeMin) {
      _fontSize.value = (_fontSize.value - fontSizeStep).clamp(
        AppConstants.materialFontSizeMin,
        AppConstants.materialFontSizeMax,
      );
      _saveFontSize();
    }
  }

  void toggleOverlay() {
    _isOverlayVisible.value = !_isOverlayVisible.value;
  }

  void hideOverlay() {
    _isOverlayVisible.value = false;
  }

  void resetFontSize() {
    _fontSize.value = AppConstants.materialFontSizeDefault;
    _saveFontSize();
  }

  String get fontSizeLabel {
    return '${_fontSize.value.toInt()}px';
  }

  // Get font scale factor for text styles
  double get fontScale {
    return _fontSize.value / AppConstants.materialFontSizeDefault;
  }
}
