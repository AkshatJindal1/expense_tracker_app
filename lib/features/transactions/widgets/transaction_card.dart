// import 'package:expense_tracker_app/core/models/enums.dart';
// import 'package:expense_tracker_app/core/models/transaction_with_everything.dart';
// import 'package:flutter/material.dart';

// class TransactionCard extends StatelessWidget {
//   final TransactionWithEverything tx;
//   final bool selectionMode;
//   final bool selected;
//   final VoidCallback onTap;
//   final VoidCallback onLongPress;
//   final VoidCallback onEdit;

//   const TransactionCard({
//     super.key,
//     required this.tx,
//     required this.selectionMode,
//     required this.selected,
//     required this.onTap,
//     required this.onEdit,
//     required this.onLongPress,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final txnId = tx.txn.id;
//     var leadingIcon = Icons.swap_horiz;
//     var leadingIconColor = Colors.blue;
//     switch (TransactionType.values.byName(tx.txn.transactionType)) {
//       case TransactionType.expense:
//         leadingIcon = Icons.remove_circle_outline;
//         leadingIconColor = Colors.red;
//         break;
//       case TransactionType.income:
//         leadingIcon = Icons.add_circle_outline;
//         leadingIconColor = Colors.green;
//         break;
//       case TransactionType.transfer:
//         leadingIcon = Icons.swap_horiz;
//         leadingIconColor = Colors.blue;
//         break;
//       default:
//         break;
//     }

//     return Card(
//       elevation: selected ? 2 : 0,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//         side: BorderSide(
//           color: Theme.of(context).colorScheme.outline,
//           width: selected ? 3 : 1,
//         ),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: onTap,
//         onLongPress: onLongPress,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               selectionMode
//                   ? GestureDetector(
//                     onTap: onTap,
//                     child: CircleAvatar(
//                       radius: 16,
//                       backgroundColor:
//                           selected
//                               ? Theme.of(context).colorScheme.primary
//                               : Colors.transparent,
//                       foregroundColor:
//                           selected
//                               ? Colors.white
//                               : Theme.of(context).colorScheme.onSurfaceVariant,
//                       child: Icon(
//                         selected ? Icons.check : leadingIcon,
//                         color: selected ? null : leadingIconColor,
//                         size: 18,
//                       ),
//                     ),
//                   )
//                   : Icon(leadingIcon, color: leadingIconColor),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${tx.txn.category} - ₹${tx.txn.amount.toStringAsFixed(2)}',
//                       style: Theme.of(context).textTheme.titleMedium,
//                     ),
//                     const SizedBox(height: 4),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         if (tx.source != null)
//                           Text(
//                             'From: ${tx.source!.name}',
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         if (tx.destination != null)
//                           Text(
//                             'To: ${tx.destination!.name}',
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         if (tx.feeSource != null)
//                           Text(
//                             'Charges: ${tx.feeSource!.name}',
//                             style: Theme.of(context).textTheme.bodySmall,
//                           ),
//                         if (tx.splits.isNotEmpty)
//                           ...tx.splits.map(
//                             (s) => Text(
//                               '${s.person?.name ?? s.split.paidFor}: ₹${s.split.amount}',
//                               style: Theme.of(context).textTheme.bodySmall,
//                             ),
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.edit),
//                 onPressed: onEdit,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
