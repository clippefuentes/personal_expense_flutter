import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key key}) : super(key: key);
  final List<Transaction> transactions;
  
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
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
                    color: Colors.green.shade700
                  )
                ),
                child: Text(
                  '\$${tx.amount.toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green[700],
                  ),
                ),
              ),
              Column(
                children: [
                  Text(tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date), 
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
      }).toList(),
    );
  }
}