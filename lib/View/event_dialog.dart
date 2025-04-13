import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';

class EventDialog extends StatefulWidget {
  const EventDialog({super.key, this.event});
  final String? event;

  @override
  State<EventDialog> createState() => _EventDialogState();
}

class _EventDialogState extends State<EventDialog> {
  final TextEditingController _eventName = TextEditingController();

  @override
  void initState() {
    if (widget.event != null) {
      _eventName.text = widget.event!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _eventName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: width(15)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _eventName,
              textDirection: TextDirection.rtl,
              maxLength: 30,
              autofocus: true,
              onSubmitted: (text) {
                Navigator.pop(context, text.trim());
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: height(1),
                    horizontal: width(2),
                  ),
                  hintText: 'چه خبره؟',
                  hintStyle: const TextStyle(color: Color(0x57ffffff)),
                  counterText: '',
                  border: const OutlineInputBorder(),
                  hintTextDirection: TextDirection.rtl),
            ),
            SizedBox(
              height: height(2),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                    Size(width(80), height(5)),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, _eventName.text.trim());
                },
                child: const Text('ثبتش کن'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
