// import 'package:expense_tracker_app/core/models/enums.dart';
// import 'package:flutter/material.dart';

// class TransactionTypeChoiceChip extends StatelessWidget {
//   final TransactionType? transactionType;
//   final void Function(TransactionType?, bool) onSelected;
//   const TransactionTypeChoiceChip({
//     super.key,
//     required this.transactionType,
//     required this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 48,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             separatorBuilder: (_, _) => const SizedBox(width: 8),
//             itemCount: TransactionType.values.length + 1,
//             itemBuilder: (context, index) {
//               final TransactionType? type =
//                   index == 0 ? null : TransactionType.values[index - 1];
//               final label = index == 0 ? Text("All") : Text(type!.label);
//               final avatar =
//                   index == 0
//                       ? Icons.select_all
//                       : switch (type!) {
//                         TransactionType.expense => Icons.remove_circle_outline,
//                         TransactionType.income => Icons.add_circle_outline,
//                         TransactionType.transfer => Icons.swap_horiz,
//                         TransactionType.investment => Icons.trending_up,
//                         TransactionType.adjustment => Icons.build,
//                       };
//               final isSelected = type == transactionType;

//               return ChoiceChip(
//                 label: label,
//                 avatar: Icon(avatar),
//                 selected: isSelected,
//                 showCheckmark: false,
//                 onSelected: (_) => onSelected(type, isSelected),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
