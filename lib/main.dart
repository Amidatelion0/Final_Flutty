// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinalApp());
}

class FinalApp extends StatelessWidget {
  const FinalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final APP',
      theme: ThemeData(
        colorScheme: const ColorScheme(background: Color.fromARGB(255, 159, 10, 234), brightness: Brightness.light, primary: Color.fromARGB(255, 141, 234, 226), onPrimary: Color.fromARGB(255, 0, 0, 0), secondary: Color.fromARGB(255, 133, 13, 13), onSecondary: Color.fromARGB(255, 159, 10, 234), error: Color.fromARGB(255, 159, 10, 234), onError: Color.fromARGB(255, 159, 10, 234), onBackground: Color.fromARGB(255, 234, 96, 10), surface: Color.fromARGB(255, 51, 205, 89), onSurface: Color.fromARGB(255, 40, 10, 234)),
      ),
      home: FinalAppHome(),
    );
  }
}

class FinalAppHome extends StatefulWidget{
  FinalAppHome({super.key});
  @override
  _Finhome createState() => _Finhome();
}

class _Finhome extends State<FinalAppHome> {
  final audioPlayer = AudioPlayer();
  bool hasPlayedBefore = false;

  @override
  void initState() {
    super.initState();
//    checkFirstLaunch(); // Example check for first launch
  }

//  void checkFirstLaunch() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    hasPlayedBefore = prefs.getBool('played_before') ?? false;
//    if (!hasPlayedBefore) {
//      playMusic();
//      prefs.setBool('played_before', true); // Update for future launches
//    }
//  }

  Future<void> playMusic() async {
    try {
      await audioPlayer.play(AssetSource('akmu.mp3'));
    } catch (error) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final App'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ark.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(" "),
              ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => FinaslRect());
                  Navigator.push(context, route);  // Add your button 1 action here
                },
                child: const SizedBox(
                  width: 250, // Set a fixed width for the button
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Hitung Luas Persegi', textScaleFactor: 1.5),
                          Text('Klik Untuk menghitung Luas Persegi'),
                        ],
                    ),
                  ),
                ),
              Text(' ', textScaleFactor: 0.2),
              ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => FinaslCirc());
                  Navigator.push(context, route);
                     // Add your button 2 action here
                },
                child: const SizedBox(
                  width: 250, // Set a fixed width for the button
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Hitung Luas Lingkaran', textScaleFactor: 1.5),
                          Text('Klik Untuk menghitung Luas Lingkaran'),
                        ],
                    ),
                  ),
              ),
              Text(' ', textScaleFactor: 0.2),
              ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => Finalabout());
                  Navigator.push(context, route);                     // Add your button 3 action here
                },
                child: const SizedBox(
                  width: 250, // Set a fixed width for the button
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Profile Developer', textScaleFactor: 1.5),
                          Text('Klik Untuk Melihat Profile Saya'),
                        ],
                    ),
                ),
              ),
            ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}


class FinaslRect extends StatefulWidget{
  const FinaslRect({super.key});

  @override
  _FinaslRectstate createState() => _FinaslRectstate();
}

class _FinaslRectstate extends State<FinaslRect>{
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  String result = '';

  void hitugluas() {
    double panjang = double.tryParse(lengthController.text) ?? 0.0;
    double lebar = double.tryParse(widthController.text) ?? 0.0;

    double area = panjang * lebar;

    setState(() {
      result = 'Luas Persegi dengan Luas $panjang dan Lebar $lebar adalah: $area';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Luas Persegi'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ark.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(' ', textScaleFactor: 0.8,),
            TextField(
              controller: lengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Panjang'),
            ),
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Lebar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitugluas,
              child: Text('Hitung Luas'),
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class FinaslCirc extends StatefulWidget{
  const FinaslCirc({super.key});

  @override
  _FinaslCircstate createState() => _FinaslCircstate();
}

class _FinaslCircstate extends State<FinaslCirc>{
  TextEditingController controlluas = TextEditingController();
  String hasil = '';

  void hitunglin() {
    double jari2 = double.tryParse(controlluas.text) ?? 0.0;
    double area = pi * pow(jari2, 2);
    String formatnum = area.toStringAsFixed(3);

    setState(() {
      hasil = 'Luas Lingkaran Dengan Jari-Jari $jari2 adalah: $formatnum';
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perhitungan Luas Lingkaran'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ark.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(' ', textScaleFactor: 0.8,),
            TextField(
              controller: controlluas,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Jari-Jari Lingkaran'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitunglin,
              child: Text('Hitung Luas'),
            ),
            Text(
              hasil,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

final Uri _url = Uri.parse('https://www.youtube.com/watch?v=Rc0nnzxeIng');
final Uri _url2 = Uri.parse('https://maps.app.goo.gl/KAjF8NDoEeoapSu56');

class Finalabout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Developer'),
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/ark.jpg'), fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(''),
            Text('Tentang Saya, Seorang Developer Pemula', textAlign: TextAlign.center, textScaleFactor: 1.3),
            Text(' ', textScaleFactor: 1),
            Image.asset("assets/images.jpg"),
            Text(' ', textScaleFactor: 0.8),
            Text('Nama : Gazali Rahman'),
            Text(' ', textScaleFactor: 0.2),
            Text('NPM : 2310020144'),
            Text(' ', textScaleFactor: 0.2),
            Text('Kelas : 5A Nonreg BJM'),
            Text(' ', textScaleFactor: 0.2),
            GestureDetector(
              onTap: () {
                _launchUrl;
              },
              child: Text(
                'Contact : ephraimgazali@gmail.com', style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
            Text(' ', textScaleFactor: 0.2),
            GestureDetector(
              onTap: () {
                _launchUrl2;
              },
              child: Text(
                'Alamat : Jl. HKSN Komp. Surya Gemilang Blok M No. 37', style: TextStyle(
                  color: Colors.blue
                ),
              ),
            ),
            Text(' ', textScaleFactor: 0.2),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> get _launchUrl async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> get _launchUrl2 async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url');
  }
}


