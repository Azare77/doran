import 'package:doran/View/remove_dialog.dart';
import 'package:doran/size_helper.dart';
import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  const EventListItem(
      {super.key,
      required this.event,
      required this.onDelete,
      required this.onEdit});
  final String event;
  final Function onDelete;
  final Function onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: width(1), vertical: height(0.5)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width(1.2), vertical: height(0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(event)),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    hoverColor: Colors.transparent,
                    splashRadius: 1,
                    onPressed: () {
                      onEdit();
                    },
                    icon: const Icon(Icons.edit_note_outlined)),
                IconButton(
                  onPressed: () async {
                    bool confirm = await showDialog(
                      context: context,
                      builder: (_) {
                        return const RemoveEvent();
                      },
                    );
                    if (confirm) {
                      onDelete();
                    }
                  },
                  icon: const Icon(Icons.delete_rounded, color: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
