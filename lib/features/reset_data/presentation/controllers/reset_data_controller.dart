import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../../../../shared/enum/chapter.dart';
import '../../../../shared/enum/kind.dart';

class ResetDataController extends GetxController {
  var isLoading = false.obs;

  Future<void> resetBab1Kitabah() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        // Clear all scramble progress for Bab 1 Kitabah using enum-based approach
        await SharedPreferencesService.clearChapterKindProgress(
          Chapter.bab1,
          Kind.kitabah,
        );

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab2Kitabah() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        // Clear all scramble progress for Bab 2 Kitabah using enum-based approach
        await SharedPreferencesService.clearChapterKindProgress(
          Chapter.bab2,
          Kind.kitabah,
        );

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetEntireChapter(Chapter chapter) async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        // Clear all progress for entire chapter
        await SharedPreferencesService.clearChapterProgress(chapter);

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetEntireKind(Kind kind) async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        // Clear all progress for specific kind across all chapters
        await SharedPreferencesService.clearKindProgress(kind);

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllData() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        // Clear all scramble progress
        await SharedPreferencesService.clearAllScrambleProgress();

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> _showConfirmationDialog(VoidCallback onConfirm) async {
    await Get.dialog(
      AlertDialog(
        title: Text(AppConstants.resetConfirmationTitle),
        content: Text(AppConstants.resetConfirmationMessage),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(AppConstants.cancelButtonText),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text(AppConstants.confirmButtonText),
          ),
        ],
      ),
    );
  }
}
