import 'package:flutter/material.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xpress_drive/ui/widget/dialog/delete_confirm.dart';

enum DialogType { confirm }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.confirm: (context, sheetRequest, completer) =>
        DeleteConfirm(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.black,
    textColor: Colors.white,
    messageColor: Colors.white,
  ));
}
