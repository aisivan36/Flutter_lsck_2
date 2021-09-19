import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlert {
  final String title;
  final String message;

  const PlatformAlert({required this.title, required this.message});

  void show(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      _buildCupertinoAlert(context);
    } else {
      _buildMaterialAlert(context);
    }
  }

  void _buildMaterialAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'))
          ],
        );
      },
    );
  }

  void _buildCupertinoAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'))
          ],
        );
      },
    );
  }
}
