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
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              shape: Border(
                bottom: BorderSide(color: Theme.of(context).splashColor),
              ),
              title: Text(model.title!),
              isThreeLine: false,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.description!),
                  Row(
                    children: [
                      if (model.type == NoteType.dailyReminding)
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2, left: 2, right: 2),
                          child: InputChip(
                            avatar: const Icon(Icons.alarm_on_rounded),
                            label:
                                Text(DateFormat.Hm().format(model.dateTime!)),
                            onSelected: (bool value) {},
                          ),
                        ),
                      if (model.type == NoteType.weeklyReminding)
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2, left: 2, right: 2),
                          child: InputChip(
                            avatar: const Icon(Icons.alarm_on_rounded),
                            label: Text(
                                '${DateFormat.Hm().format(model.dateTime!)}, each ${DateFormat.EEEE().format(model.dateTime!)}'),
                            onSelected: (bool value) {},
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.type == NoteType.scheduledReminding)
                    const Icon(Icons.alarm_on_rounded, size: 32),
                  if (model.type == NoteType.dailyReminding ||
                      model.type == NoteType.weeklyReminding)
                    const Icon(Icons.repeat_rounded, size: 32),
                ],
              ),
              trailing: Column(
                children: [
                  Text(DateFormat.yMMMd().format(model.dateTime!)),
                  Text(DateFormat.Hm().format(model.dateTime!)),
                  Text('each ${DateFormat.EEEE().format(model.dateTime!)}'),
                ],
              ),
              onTap: () => Navigator.of(context).pushNamed('/editItem'),
            ),
          ),
        ],
      );
}
