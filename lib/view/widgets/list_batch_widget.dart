import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_teams/controllers/list_batch_controller.dart';

class ListBatch extends StatelessWidget {
  const ListBatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listbatch = Provider.of<ListBatchController>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 7.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            listbatch.icon != null ? Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Icon(listbatch.icon, size: 6),
            ) : Container(),
            Text(listbatch.text, style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      transform: Matrix4.translationValues(-10.0, 0, 0),
      decoration: BoxDecoration(
        color: listbatch.color.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(6.5)),
      ),
    );
  }
}
