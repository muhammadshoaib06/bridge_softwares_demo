import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

/// A Confirmation dialog for the Deleting Item from the Cart
Future<dynamic> showSingleDeleteCartProductDialog(
    BuildContext context, int index) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Item!'),
        content: const Text('Are you sure you want to delete?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              HiveDatabase.cartProductsBox.delete('key_$index');
              showAppSnackBar(
                context: context,
                snackBarText: 'Product deleted from cart!',
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
