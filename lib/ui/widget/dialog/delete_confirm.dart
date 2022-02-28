import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';

class DeleteConfirm extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DeleteConfirm(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('DeleteConfirm');
    return Dialog(
      child: AlertDialog(
        actions: [
          TextButton(
            child: Text('CANCEL'),
            onPressed: () {
              // completer(DialogResponse(confirmed: false));
            },
          ),
          TextButton(
            child: Text('DELETE'),
            onPressed: () {
              // completer(DialogResponse(confirmed: true));
            },
          ),
        ],
        content: Text('Are you sure you want to delete this item?'),
      ),
    );
  }
}
