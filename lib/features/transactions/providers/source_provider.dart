import 'package:expense_tracker_app/core/models/source_with_everything.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/db/providers.dart';

// StreamProvider for watching all sources (live updates)
final allSourceProvider =
    StreamProvider<List<SourceWithEverything>>((ref) {
  final dao = ref.watch(sourceDaoProvider);
  return dao.watchAllSources();
});