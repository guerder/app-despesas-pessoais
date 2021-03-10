import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionItem({this.transaction, this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text("R\$${transaction.value}"),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Excluir'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => onRemove(transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onRemove(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
