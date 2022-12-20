import 'package:burc_rehberi/burc_item.dart';
import 'package:burc_rehberi/data/strings.dart';
import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget{

  late List<Burc> tumBurclar;
   BurcListesi(){
    tumBurclar = veriKaynaginiHazirla();
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Burç Rehberi'),
      ),
      body:  Center(
      child: ListView.builder(itemBuilder: (context, index) {
        return BurcItem(listelenenBurc: tumBurclar[index] ,);
      }, itemCount: tumBurclar.length),  )
    
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];
    String kucukResim, buyukResim;
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      var buyukResim = Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
      Burc eklenecekBurc = Burc(burcAdi, burcTarihi, burcDetayi, kucukResim, buyukResim);
      burclar.add(eklenecekBurc);
    }
    return burclar;
  }
}