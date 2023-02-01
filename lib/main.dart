import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 'T',
      title: 'Passive Income',
      amount: 20000,
      date: DateTime.now()
    ),
    Transaction(
      id: 'T',
      title: 'Sales',
      amount: 50000,
      date: DateTime.now()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Text('Chart')
            ),
          ),
          Column(
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
                          color: Colors.green[700]
                        )
                      ),
                      child: Text(
                        tx.amount.toString(),
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
                        Text(tx.date.toString(), 
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
          )
        ]
      ),
    );
  }
}
