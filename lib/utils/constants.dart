import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/utils/app_str.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

// Lottie asset address
String lottieUrl = 'assets/lottie/AnimationEmpty.json';

// Empty Title or Subtitle TextField warning
dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'You must fill all field!',
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

// Noting entered when user try to edit or update the current task
dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'You must edit the tasks when try to update it!',
    corner: 20.0,
    duration: 5000,
    padding: const EdgeInsets.all(20),
  );
}

// No task warning dialog for deleting
dynamic noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: AppStr.oopsMsg,
    message: 'There is no Task for Delete!\n Try add some and then delete it!',
    buttonText: "Okay",
    onTapDismiss: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

// delete all task from DB dialog
dynamic deleteAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: AppStr.areYouSure,
    message:
        'Do you Really want to delete all Tasks? You will not be able to undo this Action!',
    confirmButtonText: "Yes",
    cancelButtonText: "No",
    onTapConfirm: () {
      // we will clear all data Task with this comment later on
      BaseWidget.of(context).dataStore.box.clear();
      Navigator.pop(context);
    },
    onTapCancel: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false,
  );
}
