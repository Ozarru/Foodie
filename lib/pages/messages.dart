import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../widgets/widgets.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CourierAppBar(title: 'Messages'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              TablerIcons.message_plus,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(height: 10),
            Text(
              'Start Messaging...',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
