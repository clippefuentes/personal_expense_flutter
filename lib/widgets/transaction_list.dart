import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // const TransactionList({Key key}) : super(key: key);
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          Text('No Transaction', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover))
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
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
                    child: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),
                  ),
                ),
              ),
              title: Text(transactions[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: 
               Text(
                  DateFormat.yMMMd().format(transactions[index].date), 
                  style: TextStyle(
                    // fontSize: 20,
                    color: Color.fromARGB(255, 88, 88, 88),
                  ),
                ),
              trailing: IconButton(
                onPressed: () => deleteTx(transactions[index].id),
                icon: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
                
              ),
            ),
          );
          // return Card(
          //   child: Row(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.symmetric(
          //           vertical: 10, horizontal: 15
          //         ),
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColor,
          //           )
          //         ),
          //         child: Text(
          //           '\$${transactions[index].amount.toStringAsFixed(2)}',
          //           // style: TextStyle(
          //           //   fontWeight: FontWeight.bold,
          //           //   fontSize: 20,
          //           //   color: Theme.of(context).primaryColor,
          //           // ),
          //           style: Theme.of(context).textTheme.titleLarge,
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Text(transactions[index].title,
          //             style: TextStyle(
          //               fontWeight: FontWeight.w600,
          //               fontSize: 15,
          //               color: Colors.black87,
          //             ),
          //           ),
          //           Text(
          //             DateFormat.yMMMd().format(transactions[index].date), 
          //             style: TextStyle(
          //               // fontSize: 20,
          //               color: Color.fromARGB(255, 88, 88, 88),
          //             ),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // );
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {
        //   return ;
        // }).toList(),
      ),
    );
  }
}