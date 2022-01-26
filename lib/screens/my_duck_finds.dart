import 'package:flutter/material.dart';
import 'package:tlydp/data/user_found_ducks.dart';
import 'package:tlydp/data/utils.dart';
import 'package:tlydp/widgets/duck_card.dart';

class DuckFinds extends StatefulWidget {
  const DuckFinds({Key? key}) : super(key: key);

  @override
  DuckFindsState createState() => DuckFindsState();
}

class DuckFindsState extends State<DuckFinds> {  
  List<UserFoundDucks> duckFinds = Utils.getUserFoundDucks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            child: Column(
              children: [Expanded(
                child: ListView.builder(
                  itemCount: duckFinds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: DuckCard(
                        duckFinds[index].duckName,
                        duckFinds[index].locationFound,
                        duckFinds[index].comments,
                        duckFinds[index].img,)
                    );
                  },
                ),
              ),
            ]
          ),
      )
    );
  }
}
