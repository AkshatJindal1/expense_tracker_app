import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expense_tracker_app/db/app_database.dart';
import 'package:expense_tracker_app/db/providers.dart';

class FundSourceDropdown extends ConsumerWidget {
  final String label;
  final String? selectedFundSourceId;
  final List<String>? excludeSourceIds;
  final void Function(String?) onChanged;
  final FormFieldValidator<String>? validator;

  const FundSourceDropdown({
    super.key,
    required this.label,
    required this.selectedFundSourceId,
    required this.onChanged,
    this.excludeSourceIds,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    return FutureBuilder<List<Source>>(
      future: db.select(db.sources).get(),
      builder: (context, snapshot) {
        final sources = snapshot.data ?? [];

        return Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedFundSourceId,
              items:
                  sources
                      .where((s) => !(excludeSourceIds ?? []).contains(s.id))
                      .map(
                        (s) =>
                            DropdownMenuItem(value: s.id, child: Text(s.name)),
                      )
                      .toList(),
              onChanged: onChanged,
              decoration: InputDecoration(labelText: label),
              validator: validator,
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
