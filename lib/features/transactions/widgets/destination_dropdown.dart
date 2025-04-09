import 'package:flutter/material.dart';
import 'fund_source_dropdown.dart';

class DestinationDropdown extends StatelessWidget {
  final String? selectedToSourceId;
  final String? excludeSourceId;
  final void Function(String?) onChanged;

  const DestinationDropdown({
    super.key,
    required this.selectedToSourceId,
    required this.excludeSourceId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FundSourceDropdown(
      label: 'Destination',
      selectedFundSourceId: selectedToSourceId,
      excludeSourceIds: [excludeSourceId ?? ''],
      onChanged: onChanged,
      validator: (val) => val == null || val.isEmpty ? 'Please select destination' : null,
    );
  }
}
