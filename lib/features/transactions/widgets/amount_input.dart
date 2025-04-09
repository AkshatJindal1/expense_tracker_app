import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;

  const AmountInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Amount'),
          validator:
              (val) => val == null || val.isEmpty ? 'Enter amount' : null,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
