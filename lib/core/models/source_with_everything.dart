import 'package:expense_tracker_app/db/app_database.dart';
// import 'package:expense_tracker_app/db/tables/source_category.dart';

class SourceWithEverything {
  final Source source;
  final SourceType? sourceType;
  final SourceCategory? sourceCategory;

  SourceWithEverything({
    required this.source,
    this.sourceType,
    this.sourceCategory,
  });
}
