import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int sayac = 0;

  @override
  void initState() {
    super.initState();
    // test();
    sayacKontrol();
  }

  Future<void> test() async {
    var sp = await SharedPreferences.getInstance();

    // veri kaydı
    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar", true);

    var arkadaslar = <String>[];
    arkadaslar.add("ece");
    arkadaslar.add("ali");

    sp.setStringList("arkadas", arkadaslar);

    // veri okuma
    String gelenAd = sp.getString("ad") ??
        "isim yok"; // ad keyi yoksa döndürülecek default değer
    print("$gelenAd");

    // veri silme
    //sp.remove("ad");
  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac++;
    });

    sp.setInt("sayac", sayac);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sayaç uygulaması"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Açılış Sayısı: $sayac",
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
