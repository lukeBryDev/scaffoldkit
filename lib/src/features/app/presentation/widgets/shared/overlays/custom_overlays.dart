import 'dart:developer';

import 'package:{PROJECT_NAME}/src/config/error/failures.dart';
import 'package:flutter/material.dart';

class Show {
  static void eitherError(Failure l, BuildContext context) {
    var message = l.message;
    if (l is ServerFailure && l.data!.containsKey("data")) {
      try {
        message = message! +
            l.data!['data'].values
                .toString()
                .replaceAll("[", ",")
                .replaceAll("]", "")
                .replaceAll("(", "")
                .replaceAll(")", "");
      } catch (error) {
        log("$error", name: "Error: eitherError");
      }
    }
    return snackBarError(context, "¡Ups, algo va mal!", message ?? "");
  }

  static void snackBarError(
    BuildContext context,
    String title,
    String subTitle, {
    Duration? delay,
    void Function()? onTap,
    void Function(dynamic data)? onTapWithData,
    dynamic data,
    Widget? widgetSubtitle,
  }) {
    final snackBar = SnackBar(
      content: Text(title),
      action: SnackBarAction(
        label: 'Details',
        onPressed: () => _dialogErrorDetailsBuilder(context, details: subTitle),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> _dialogErrorDetailsBuilder(BuildContext context,
      {required String details}) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error details'),
          content: Text(details),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
