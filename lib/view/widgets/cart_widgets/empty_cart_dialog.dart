import 'package:bridge_softwares_demo/services/hive_database.dart';
import 'package:bridge_softwares_demo/view/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

/// A Confirmation Dialog for the emptying the Cart
Future<void> showDeleteCartProductsDialog(
    BuildContext context, int index) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Clear Cart!'),
        content: const Text('Are you sure you want to delete?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              HiveDatabase.cartProductsBox.clear();
              showAppSnackBar(
                context: context,
                snackBarText: 'Cart is cleared!',
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
