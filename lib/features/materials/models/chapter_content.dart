import '../../../shared/enum/chapter.dart';
import 'kind_content.dart';

class ChapterContent {
  final Chapter chapter;
  final List<KindContent> kinds;

  ChapterContent({required this.chapter, required this.kinds});
}
