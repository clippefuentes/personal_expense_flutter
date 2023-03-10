import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import '../models/transaction.dart';
// import './widgets/user_transactions.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        // primarySwatch: Colors.green,
        // accentColor: Colors.amber,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.green,
          error: Colors.red,
        ),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
          ),
          // button: 
        ),
        appBarTheme: AppBarTheme(
          // textTheme: ThemeData.light().textTheme.copyWith(
          //   title:
          // )
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 'T',
    //   title: 'Passive Income',
    //   amount: 20000,
    //   date: DateTime.now()
    // ),
    // Transaction(
    //   id: 'T',
    //   title: 'Sales',
    //   amount: 50000,
    //   date: DateTime.now()
    // ),
  ];

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    },).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      title: title,
      amount: amount, 
      date: date,
      id: DateTime.now().toString()
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_recentTransactions');
    print(_recentTransactions);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App', style: TextStyle(fontFamily: 'OpenSans'),),
        actions: [
           IconButton(
            onPressed: () {
              _startAddNewTransaction(context);
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            Container(child: TransactionList(_transactions, _deleteTransaction)),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
