import 'package:flutter/material.dart';
import 'package:todoapp/shared/widgets/button.dart';

class DialogBody extends StatelessWidget {
  const DialogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 13.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Flexible(
              child: Text(
                'Deseja realmente excluir essa nota?',
              ),
            ),
            const SizedBox(height: 41.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  title: 'Sim',
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: 30.0,
                  active: true,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
                Button(
                  title: 'Nāo',
                  width: MediaQuery.of(context).size.width * 0.28,
                  height: 30.0,
                  active: true,
                  onPressed: () {
                    // Navigator.pop(context, false);
                    Navigator.of(context, rootNavigator: true).pop(false);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
