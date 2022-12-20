import 'package:burc_rehberi/burc_detay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:burc_rehberi/models/burc.dart';

class BurcItem extends StatelessWidget{
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => BurcDetay(secilenBurc: listelenenBurc,)));
        },
        leading: Image.asset('assets/images/' + listelenenBurc.burcKucukResim),
        title:  Text(listelenenBurc.burcAdi,
        style: myTextStyle.headline6),
        subtitle:  Text(listelenenBurc.burcTarihi
        , style: myTextStyle.subtitle1),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}