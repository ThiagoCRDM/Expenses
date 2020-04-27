import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> listTransaction;
  final Function(String) remove;

  const TransactionList({Key key, this.listTransaction, this.remove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: listTransaction.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nenhuma transação cadastrada!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/imag1.png',
                    fit: BoxFit.cover,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: listTransaction.length,
              itemBuilder: (_, index) {
                final tr = listTransaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text('R\$${tr.value.toStringAsFixed(2)}')),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => remove(tr.id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
