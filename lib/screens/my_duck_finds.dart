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
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text("TLYDP",
            style: TextStyle(
              fontFamily: "CherryBomb",
              fontSize: 60,
              color: Color.fromARGB(255, 185, 137, 109)
            ),
          )
        ),
        backgroundColor: Colors.white.withOpacity(0.75),
      ),
      body: Container(
              child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text("Ducks I've Found",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CherryBomb",
                      fontSize: 40,
                    ),
                  )
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: duckFinds.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          child: DuckCard(
                            duckFinds[index].duckName,
                            duckFinds[index].locationFound,
                            duckFinds[index].img,
                          ),
                        ),
                        onTap: () {
                          showDuckInfo(
                            context, 
                            duckFinds[index].duckName,
                            duckFinds[index].locationFound,
                            duckFinds[index].img,
                            duckFinds[index].comments
                          );
                        },
                      );
                    },
                  ),
                )]
              ),
            ),
    );
  }
}

showDuckInfo(context, duckName, locationFound, img, comments) {
  return showDialog(
    context: context, 
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-6, 6),
              ),],
              border: Border.all(
                color: const Color.fromARGB(255, 185, 137, 109),
                width: 3
              ),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 241, 216, 129),
            ),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 500,
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(img),
                      height: 250,
                    )
                  )
                ),
                Positioned(
                  top: 250,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Text(duckName, 
                      style: const TextStyle(
                        fontFamily: "CherryBomb",
                        fontSize: 50,
                        color: Color.fromARGB(255, 255, 112, 112)
                      ),
                    )
                  )
                ),
                Positioned(
                  top: 320,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text(locationFound, 
                      style: const TextStyle(
                        fontFamily: "CherryBomb",
                        fontSize: 30,
                        color: Color.fromARGB(255, 255, 112, 112)
                      ),
                    )
                  )
                ),
                Positioned(
                  top: 350,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Text(comments, 
                      style: const TextStyle(
                        fontFamily: "CherryBomb",
                        fontSize: 26,
                        color: Color.fromARGB(255, 185, 137, 109)
                      ),
                    )
                  )
                ),
              ]
            )
          ),
        ),
      );
    }
  );
}