import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class WidgetUtils {
  static AppBar createAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  static Container createCircularProgress() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static void createAlertDialog(
      {required BuildContext context,
      @Default(null) String? title,
      @Default(null) String? message,
      @Default(null) String? cancelBtnText,
      @Default(null) String? okBtnText}) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: title == null ? null : Text(title),
          content: message == null ? null : Text(message),
          actions: <Widget>[
            if (cancelBtnText != null)
              TextButton(
                child: Text(cancelBtnText),
                onPressed: () => Navigator.pop(context),
              ),
            if (okBtnText != null)
              TextButton(
                child: Text(okBtnText),
                onPressed: () => Navigator.pop(context),
              ),
          ],
        );
      },
    );
  }
}
