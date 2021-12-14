import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminding_notes/models/note_view_model.dart';

class NoteListItemWidget extends StatelessWidget {
  final NoteViewModel model;

  const NoteListItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Slidable(
            enabled: model.status != NoteStatus.done,
            key: const ValueKey(0),
            startActionPane: ActionPane(
              extentRatio: 0.236,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) =>
                      Navigator.of(context).pushNamed('/editItem'),
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  icon: Icons.edit_rounded,
                  label: 'Edit',
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.236,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_rounded,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              enabled: model.status != NoteStatus.done,
              shape: Border(
                bottom: BorderSide(color: Theme.of(context).splashColor),
              ),
              title: Text(model.title!),
              isThreeLine: false,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.description!),
                ],
              ),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.status == NoteStatus.done)
                    const Icon(Icons.done_rounded, size: 32)
                  else if (model.type == NoteType.scheduledReminding)
                    const Icon(Icons.alarm_on_rounded, size: 32)
                  else if (model.type == NoteType.dailyReminding ||
                      model.type == NoteType.weeklyReminding ||
                      model.type == NoteType.monthlyReminding ||
                      model.type == NoteType.annualReminding)
                    const Icon(Icons.repeat_rounded, size: 32),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(DateFormat.Hm().format(model.dateTime!)),
                  if (model.type == NoteType.dailyReminding)
                    const Text('daily'),
                  if (model.type == NoteType.weeklyReminding)
                    Text('each ${DateFormat.EEEE().format(model.dateTime!)}'),
                  if (model.type == NoteType.monthlyReminding)
                    const Text('monthly'),
                  if (model.type == NoteType.annualReminding)
                    const Text('annual'),
                ],
              ),
              onTap: () => Navigator.of(context).pushNamed('/editItem'),
            ),
          ),
        ],
      );
}
