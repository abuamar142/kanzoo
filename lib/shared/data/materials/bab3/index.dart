// Bab 3 Materials - Export all material types for Chapter 3
import '../../../models/material_content.dart';
import 'istima.dart';
import 'kalam.dart';
import 'kitabah.dart';
import 'mufrodat.dart';
import 'qiroah.dart';
import 'qowaid.dart';

export 'istima.dart';
export 'kalam.dart';
export 'kitabah.dart';
export 'mufrodat.dart';
export 'qiroah.dart';
export 'qowaid.dart';

class Bab3Materials {
  static final List<MaterialContent> all = [
    qiroahBab3,
    kitabahBab3,
    qowaidBab3,
    istimaBab3,
    kalamBab3,
    content,
  ];

  static MaterialContent? getByKind(String kind) {
    try {
      return all.firstWhere((material) => material.kind == kind);
    } catch (e) {
      return null;
    }
  }

  static List<String> get availableKinds => all.map((m) => m.kind!).toList();
}
