import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> showErrorModal(BuildContext context, String text,
    {Function? callback,
    bool dismissible = true,
    String callbackText = 'OK'}) async {
  await showGeneralDialog(
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(opacity: anim1, child: child),
    ),
    context: context,
    barrierDismissible: dismissible,
    barrierLabel: '',
    barrierColor: Colors.black26,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      content: Wrap(alignment: WrapAlignment.center, children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Wrap(
                    children: [
                      Text(
                        text,
                        key: const Key('showErrorModalText'),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: const Key('showErrorModalButton'),
                      onPressed: () {
                        Modular.to.pop();
                        if (callback != null) {
                          callback();
                        }
                      },
                      child: Text(
                        callbackText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    ),
  );
}
