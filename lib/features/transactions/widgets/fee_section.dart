import 'fund_source_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/db/app_database.dart';

class FeeSection extends StatelessWidget {
  final TextEditingController feeController;
  final String? selectedFeeSourceId;
  final void Function(String?) onChanged;

  const FeeSection({
    super.key,
    required this.feeController,
    required this.selectedFeeSourceId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: feeController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Fee Amount (optional)'),
        ),
        FundSourceDropdown(
          label: 'Fee paid from',
          selectedFundSourceId: selectedFeeSourceId,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
