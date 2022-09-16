import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/providerrtdb.dart';


class SetPicker extends StatefulWidget {
  const SetPicker({Key? key}) : super(key: key);

  @override
  State<SetPicker> createState() => _SetPickerState();
}

class _SetPickerState extends State<SetPicker> {
  final _database = FirebaseDatabase.instance.ref();

  var list = List<int>.generate(30, (i) => 15 + i);
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderRTDB>(builder: (context, data, child) {
      return data.datosProvider != null
          ? Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: 70,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(
                    initialItem: data.datosProvider!.tempSetting -15),
                itemExtent: 64,
                children: list
                    .map((grados) => Center(
                          child: Text(
                            "$grados°",
                            style: const TextStyle(color: Colors.green),
                          ),
                        ))
                    .toList(),
                onSelectedItemChanged: (index) async {
                  setState(
                    () {
                      _database.child("data").update({"setTemp": index +15 });
                    },
                  );
                },
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            );
    });
  }
}
