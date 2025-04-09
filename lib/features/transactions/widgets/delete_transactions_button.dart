import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:expense_tracker_app/db/providers.dart';

class DeleteTransactionsButton extends ConsumerWidget {
  final Set<String> selectedTxnIds;
  final void Function() onDeletionComplete;

  const DeleteTransactionsButton({
    super.key,
    required this.selectedTxnIds,
    required this.onDeletionComplete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(appDatabaseProvider);
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Delete Transactions'),
            content: Text(
              'Are you sure you want to delete ${selectedTxnIds.length} transactions?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete'))
            ]
          )
        );

        if (confirmed == true) {
          for (final id in selectedTxnIds) {
            await db.transactionDao.deleteTransaction(id);
          }

          onDeletionComplete.call();
        }
      },
    );
  }
}