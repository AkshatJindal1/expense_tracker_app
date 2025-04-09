import 'package:flutter/material.dart';
import 'package:expense_tracker_app/core/models/enums.dart';

class TransactionTypeDropdown extends StatelessWidget {
  final TransactionType value;
  final void Function(TransactionType?) onChanged;

  const TransactionTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<TransactionType>(
          value: value,
          items:
              TransactionType.values.map((type) {
                return DropdownMenuItem(value: type, child: Text(type.label));
              }).toList(),
          onChanged: onChanged,
          decoration: const InputDecoration(labelText: 'Transaction Type'),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
