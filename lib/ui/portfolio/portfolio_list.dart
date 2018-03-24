import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioList extends StatelessWidget {

  final List<Object> coins;
  final String fiat;

  @override
  PortfolioList({this.coins, this.fiat});

  @override
  Widget build(BuildContext ctx) {
    // ignore: undefined_operator
    coins.sort((a, b) => a['buyPriceUSD'] > b['buyPriceUSD'] ? -1 : 1);
    NumberFormat currencyFormat = new NumberFormat.currency(decimalDigits: 2, name: 'fiat', symbol: ' $fiat ');
    List<DataRow> rows = new List.generate(coins.length, (int i) {
      Object coin = coins[i];
      return new DataRow(cells: [
        // ignore: undefined_operator
        new DataCell(new Text(coin['symbol'].toString().toUpperCase())),
        // ignore: undefined_operator
        new DataCell(new Text(coin['amount'].toStringAsFixed(8))),
        // ignore: undefined_operator
        new DataCell(new Text(coin['buyPriceUSD'].toStringAsFixed(8))),
      ]);
    });
    return new DataTable(
        columns: [
          new DataColumn(label: new Text('Symbol')),
          new DataColumn(label: new Text('Amount')),
          new DataColumn(label: new Text('Buy Price USD')),
        ],
        rows: rows
    );
  }
}