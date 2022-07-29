import 'package:flutter/material.dart';

import '../../core/helper/helper_handler.dart';

class BottomSheets {
  static Future<T?> showSheet<T>(BuildContext context,
      {required Widget child, bool isDismissible = true, double? value = .7}) {
    return showModalBottomSheet<T>(
        isDismissible: isDismissible,
        isScrollControlled: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Icon(Icons.maximize),
              Flexible(
                  child: SizedBox(
                      height: Utils.getDeviceHeight(context) * value!,
                      child: child)),
            ],
          );
        });
  }

  static PersistentBottomSheetController<T> showPersistentSheet<T>(
      BuildContext context,
      {required Widget child}) {
    return showBottomSheet<T>(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.maximize),
              Flexible(child: child),
            ],
          );
        });
  }
}
