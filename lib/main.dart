import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Expanded myButton(int number,Color c,String title){
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom:1),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
                onPressed: ()    {
                  playMusic(number);
                  
          
                },
                icon: Icon(Icons.music_note,
                          color: c,),
                label: Text(title,
                style:TextStyle(
                  color: c,
                  fontSize: 20,
                )),
              ),
            ),
          );
  }
  Future<void> playMusic(int number) async {
      final player = AudioPlayer();                   // Create a player
              final duration = await player.setUrl(           // Load a URL
                  'assets/assets_music-$number.mp3');                 // Schemes: (https: | file: | asset: )
              player.play();

    }

  @override
  Widget build(BuildContext context) {
    
    String audioasset = "assets/assets_music-1.mp3";
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          title: Text('أنغامي'),
          backgroundColor: Colors.purple,
          
        ),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            myButton(6,Colors.red,'Samsung Galaxy'),
            myButton(1,Colors.green,'Samsung note'),
            myButton(2,Colors.blue,'Nokia'),
            myButton(3,Colors.yellow,'Iphone'),
            myButton(4,Colors.black,'Samsung S7'),
            myButton(5,Colors.grey,'Iphone 11'),
      
        ],
        )
      ),
    );
  }
}