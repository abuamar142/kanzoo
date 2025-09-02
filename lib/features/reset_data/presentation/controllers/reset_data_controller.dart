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
        await SharedPreferencesService.clearChapterKitabahProgress(
          Chapter.bab1,
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
        await SharedPreferencesService.clearChapterKitabahProgress(
          Chapter.bab2,
        );

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllKitabah() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearAllKitabahProgress();
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
        // Clear all scramble progress and exercise progress
        await SharedPreferencesService.clearAllScrambleProgress();
        await SharedPreferencesService.clearAllExerciseProgress();

        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  // Exercise-specific reset methods
  Future<void> resetBab1Istima() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterIstimaProgress(Chapter.bab1);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab2Istima() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterIstimaProgress(Chapter.bab2);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab3Istima() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterIstimaProgress(Chapter.bab3);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllIstima() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearAllIstimaProgress();
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllExercises() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearAllExerciseProgress();
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  // New methods for Sumatif reset
  Future<void> resetBab1Sumatif() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterSumatifProgress(
          Chapter.bab1,
        );
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab2Sumatif() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterSumatifProgress(
          Chapter.bab2,
        );
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab3Sumatif() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterSumatifProgress(
          Chapter.bab3,
        );
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllSumatif() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearAllSumatifProgress();
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  // New methods for Qowaid reset
  Future<void> resetBab1Qowaid() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterQowaidProgress(Chapter.bab1);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab2Qowaid() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterQowaidProgress(Chapter.bab2);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetBab3Qowaid() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearChapterQowaidProgress(Chapter.bab3);
        AppSnackbar.showSuccess(message: AppConstants.resetSuccessMessage);
      } catch (e) {
        AppSnackbar.showError(message: '${AppConstants.generalError}: $e');
      } finally {
        isLoading.value = false;
      }
    });
  }

  Future<void> resetAllQowaid() async {
    await _showConfirmationDialog(() async {
      isLoading.value = true;
      try {
        await SharedPreferencesService.clearAllQowaidProgress();
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
