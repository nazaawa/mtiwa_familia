import 'package:flutter/material.dart';

void showFamilyTreeViewOptions(
    BuildContext context, String selectedMethod, Function(String?) onChanged) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Select family tree view',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            RadioListTile<String>(
              value: 'sosa',
              groupValue: selectedMethod,
              onChanged: (value) {
                onChanged(value);
                Navigator.pop(context);
              },
              title: const Text('Sosa-Stradonitz number'),
            ),
            RadioListTile<String>(
              value: 'pelissier',
              groupValue: selectedMethod,
              onChanged: (value) {
                onChanged(value);
                Navigator.pop(context);
              },
              title: const Text('Pelissier number'),
            ),
            RadioListTile<String>(
              value: 'all',
              groupValue: selectedMethod,
              onChanged: (value) {
                onChanged(value);
                Navigator.pop(context);
              },
              title: const Text('All members'),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              title: const Center(child: Text('Cancel')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
