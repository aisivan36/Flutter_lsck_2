import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class MainDialog extends StatelessWidget {
  const MainDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeDialog(),
    );
  }
}

class HomeDialog extends StatelessWidget {
  const HomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAlert(context);
              },
              child: const Text('Show Alert!'),
            ),
            ElevatedButton(
              onPressed: () {
                _showListAlert(context);
              },
              child: const Text('Show List Alert!'),
            ),
            ElevatedButton(
              onPressed: () {
                _showConfirmationAlert(context);
              },
              child: const Text('Show List Alert!'),
            ),
          ],
        ),
      ),
    );
  }

  _showConfirmationAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
              title: const Text('Discard draft?'),
              content: const Text('Action cannot be undone'),
              actions: [
                BasicDialogAction(
                  title: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BasicDialogAction(
                  title: const Text('Discard'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  _showAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: const Text('Current Location Not Available'),
        content: const Text(
            'Your current location can\'t be determined at this time'),
        actions: [
          BasicDialogAction(
            title: const Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  _showListAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: const Text('Select account'),
        content: Expanded(
          flex: 3,
          child: SizedBox(
            height: 200,
            child: ListView(
              children: [
                _buildListSampleItem('First one'),
                _buildListSampleItem('Second one'),
                _buildListSampleItem('Third one'),
                _buildListSampleItem('Forth'),
                // Text('data'),
                // Text('data'),
                // Text('data'),
                // Text('data'),
              ],
            ),
          ),
        ),
        actions: [
          BasicDialogAction(
            title: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildListSampleItem(String title) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const CircleAvatar(),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
