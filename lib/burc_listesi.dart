import 'package:burc_rehberi/data/strings.dart';
import 'package:flutter/material.dart';

import 'burc_anasayfa.dart';
import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi({Key? key}) : super(key: key) {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burçlar Listesi'),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BurcAnasayfa(
                listelenenBurc: tumBurclar[index],
              );
            },
            itemCount: tumBurclar.length),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, kucukResim, buyukResim);
      gecici.add(eklenecekBurc);
    }

    return gecici;
  }
}
