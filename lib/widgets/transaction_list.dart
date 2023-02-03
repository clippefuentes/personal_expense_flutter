import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key key}) : super(key: key);
  final List<Transaction> transactions;
  
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    )
                  ),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    // style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 20,
                    //   color: Theme.of(context).primaryColor,
                    // ),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Column(
                  children: [
                    Text(transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date), 
                      style: TextStyle(
                        // fontSize: 20,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {
        //   return ;
        // }).toList(),
      ),
    );
  }
}