import 'dart:html';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Row(
      children: [
        Column(
          children: [ Container( 
            child: const Icon(Icons.person, size: 250,),
            width: 250,
            
          )
            ],
      ),
        Column(children: const [

          Text('Muhsin ATINTOP'),
          Text('BUTTON')
              
        ],
        ),
      ],
    )


    );
    
  }
}
