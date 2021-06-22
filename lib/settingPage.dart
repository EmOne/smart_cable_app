import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instrument setting'),
      ),
      body: Center(
        child: Container(
        child: Table(
          children: [
            TableRow(
              children: [
                TableCell(
                  child:  Text("Software ver."),
                )
              ]
            ),
            TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ), TableRow(
                children: [
                  TableCell(
                    child:  Text("Software ver."),
                  )
                ]
            ),
          ],
        ),
        )
      ),
    );
  }
}
