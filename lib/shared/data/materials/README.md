# Chapter Materials Data Structure

This document explains the new structure for organizing materials by chapters and kinds in the
Kanzoo app.

## Overview

The new structure uses `ChapterContent` and `KindContent` models to organize materials in a
hierarchical way:

```
ChapterContent (Chapter 1, 2, 3)
├── KindContent (Kitabah)
│   └── SimpleMaterialContent (sections)
└── KindContent (Qiroah)
    └── SimpleMaterialContent (sections)
```

## Key Files

### Models

- `ChapterContent` - Represents a chapter with its available kinds
- `KindContent` - Represents a kind (Kitabah, Qiroah, etc.) with its material content
- `SimpleMaterialContent` - Contains the actual material sections

### Data Files

- `bab1/index.dart` - Exports `bab1Content` with kitabah and qiroah
- `bab2/index.dart` - Exports `bab2Content` with kitabah and qiroah
- `bab3/index.dart` - Exports `bab3Content` with kitabah and qiroah
- `chapter_materials_data.dart` - Centralized access to all chapters

### Material Files

- `bab*/kitabah.dart` - Contains `kitabahBab*Content` getter functions
- `bab*/qiroah.dart` - Contains `qiroahBab*Content` getter functions

## Usage Examples

### Get all chapters

```dart
final chapters = ChapterMaterialsData.allChapters;
```

### Get specific chapter

```dart
final bab1 = ChapterMaterialsData.getByChapter(Chapter.bab1);
```

### Access material content

```dart
final bab1 = ChapterMaterialsData.getByChapter(Chapter.bab1);
if (bab1 != null) {
  for (final kindContent in bab1.kinds) {
    print('Kind: ${kindContent.kind.title}');
    print('Sections: ${kindContent.material.sections.length}');
  }
}
```

### Find specific kind in a chapter

```dart
final kitabah = bab1?.kinds
    .where((k) => k.kind == Kind.kitabah)
    .firstOrNull;
```

## Current Implementation

Currently implemented for:

- ✅ **Kitabah** - All chapters (Bab 1, 2, 3)
- ✅ **Qiroah** - All chapters (Bab 1, 2, 3)

Other kinds (Istima, Kalam, Qowaid, Mahfudzot, Mufrodat) still use the old `MaterialContent` system
and can be added later.

## Benefits

1. **Type Safety** - Uses enums for chapters and kinds
2. **Consistency** - Same structure across all chapters
3. **Extensibility** - Easy to add new kinds and chapters
4. **Centralized Access** - Single point to access all materials
5. **Clean Architecture** - Separates data organization from presentation
