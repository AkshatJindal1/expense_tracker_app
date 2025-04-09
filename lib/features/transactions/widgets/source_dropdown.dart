import 'package:flutter/material.dart';
import 'fund_source_dropdown.dart';

class SourceDropdown extends StatelessWidget {
  final String? selectedSourceId;
  final void Function(String?) onChanged;

  const SourceDropdown({
    super.key,
    required this.selectedSourceId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return FundSourceDropdown(
      label: 'Source',
      selectedFundSourceId: selectedSourceId,
      onChanged: onChanged);
  }
}