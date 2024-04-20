import 'package:flutter/material.dart';

class MyPopupMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        switch (result) {
          case 'delete':
            // Handle delete action
            print('Delete clicked');
            break;
          case 'edit':
            // Handle edit action
            print('Edit clicked');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
      ],
    );
  }
}
