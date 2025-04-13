import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';

class RemoveEvent extends StatelessWidget {
  const RemoveEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             const Text(
              'می‌خوای این رویداد رو حذف کنی؟',
              style: TextStyle(
                  fontSize:17,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('شک نکن'),
                  ),
                ),
                SizedBox(width: width(5)),
                Flexible(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red)),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('نه خداییش'),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
