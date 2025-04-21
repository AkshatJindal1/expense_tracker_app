// import 'package:expense_tracker_app/core/models/enums.dart';
// import 'package:expense_tracker_app/features/transactions/views/add_transaction_screen.dart';
// import 'package:expense_tracker_app/features/transactions/widgets/add_menu.dart';
// import 'package:expense_tracker_app/features/transactions/widgets/app_drawer.dart';
// import 'package:expense_tracker_app/features/transactions/widgets/delete_transactions_button.dart';
// import 'package:expense_tracker_app/features/transactions/widgets/transaction_card.dart';
// import 'package:expense_tracker_app/features/transactions/widgets/transaction_type_choicechip.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:expense_tracker_app/features/transactions/providers/transactions_provider.dart';

// class TransactionListScreen extends ConsumerStatefulWidget {
//   const TransactionListScreen({super.key});

//   @override
//   ConsumerState<TransactionListScreen> createState() =>
//       _TransactionListScreenState();
// }

// class _TransactionListScreenState extends ConsumerState<TransactionListScreen> {
//   final Set<String> _selectedTxnIds = {};
//   bool _selectionMode = false;
//   TransactionType? _filterType;

//   @override
//   Widget build(BuildContext context) {
//     final ref = this.ref;
//     final asyncTxns = ref.watch(allTransactionsProvider);

//     List<FabMenuEntry> menuItems = [
//       FabMenuEntry(
//         label: 'Add Expense',
//         icon: Icons.shopping_cart,
//         onTap:
//             () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const AddTransactionScreen()),
//             ),
//       ),
//       FabMenuEntry(
//         label: 'Add Transfer',
//         icon: Icons.swap_horiz,
//         onTap:
//             () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder:
//                     (_) => const AddTransactionScreen(
//                       defaultType: TransactionType.transfer,
//                     ),
//               ),
//             ),
//       ),
//       FabMenuEntry(
//         label: 'Add Icome',
//         icon: Icons.attach_money,
//         onTap:
//             () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder:
//                     (_) => const AddTransactionScreen(
//                       defaultType: TransactionType.income,
//                     ),
//               ),
//             ),
//       ),
//     ];

//     return PopScope(
//       canPop: !_selectionMode,
//       onPopInvokedWithResult: (didPop, _) {
//         if (!didPop && _selectionMode) {
//           setState(() {
//             _selectionMode = false;
//             _selectedTxnIds.clear();
//           });
//         }
//       },
//       child: Scaffold(
//         drawer: AppDrawer(),
//         appBar: AppBar(
//           title: Text(
//             _selectionMode
//                 ? '${_selectedTxnIds.length} selected'
//                 : 'Transactions',
//           ),
//           actions: [
//             if (_selectionMode)
//               DeleteTransactionsButton(
//                 selectedTxnIds: _selectedTxnIds,
//                 onDeletionComplete:
//                     () => setState(() {
//                       _selectionMode = false;
//                       _selectedTxnIds.clear();
//                     }),
//               ),
//           ],
//         ),
//         floatingActionButton: AddMenu(items: menuItems),
//         body: asyncTxns.when(
//           data: (txns) {
//             if (txns.isEmpty) {
//               return const Center(child: Text("No transactions yet"));
//             }
//             final filteredTxns =
//                 _filterType == null
//                     ? txns
//                     : txns
//                         .where(
//                           (t) => t.txn.transactionType == _filterType!.name,
//                         )
//                         .toList();

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TransactionTypeChoiceChip(
//                   transactionType: _filterType,
//                   onSelected:
//                       (type, isSelected) => setState(
//                         () => _filterType = isSelected ? null : type,
//                       ),
//                 ),
//                 SizedBox(height: 12),
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 12,
//                     ),
//                     itemCount: filteredTxns.length,
//                     itemBuilder: (context, index) {
//                       final tx = filteredTxns[index];
//                       final txnId = tx.txn.id;
//                       final selected = _selectedTxnIds.contains(txnId);

//                       return TransactionCard(
//                         tx: tx,
//                         selectionMode: _selectionMode,
//                         selected: selected,
//                         onTap: () {
//                           if (_selectionMode) {
//                             setState(() {
//                               if (selected) {
//                                 _selectedTxnIds.remove(txnId);
//                                 if (_selectedTxnIds.isEmpty) {
//                                   _selectionMode = false;
//                                 }
//                               } else {
//                                 _selectedTxnIds.add(txnId);
//                               }
//                             });
//                           }
//                         },
//                         onEdit: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder:
//                                   (_) => AddTransactionScreen(existing: tx),
//                             ),
//                           );
//                         },
//                         onLongPress: () {
//                           setState(() {
//                             _selectionMode = true;
//                             _selectedTxnIds.add(txnId);
//                           });
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (e, _) => Center(child: Text('Error: $e')),
//         ),
//       ),
//     );
//   }
// }
