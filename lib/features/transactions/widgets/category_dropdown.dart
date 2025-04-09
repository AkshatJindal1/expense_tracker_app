import 'package:flutter/material.dart';

class CategoryInput extends StatelessWidget {
  final String? initialValue;
  final void Function(String) onChanged;

  const CategoryInput({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: const InputDecoration(labelText: 'Category'),
      onChanged: onChanged,
    );
  }
}