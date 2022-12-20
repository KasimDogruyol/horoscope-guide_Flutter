import 'package:burc_rehberi/models/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget{
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc,Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appbarRengi = Colors.pink;
  late PaletteGenerator _paletteGenerator;

  @override
  void initState() {
    super.initState();
    appbarRengiBul();
    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background:  Image.asset('assets/images/' + widget.secilenBurc.burcBuyukResim, fit: BoxFit.cover,),
              centerTitle: true,
              title:  Text(widget.secilenBurc.burcAdi + ' Burcu ve Özellikleri'),
            ),
          ),
          SliverToBoxAdapter(
            child:  SingleChildScrollView(
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Text(widget.secilenBurc.burcDetayi, style: const TextStyle(fontSize: 18, color: Colors.black),),
              ),
            ),
          )
        ],
        // child:  Column(
        //   children: [
        //     Text(secilenBurc.burcAdi),
        //     Expanded(child:  Image.asset('assets/images/' + secilenBurc.burcBuyukResim)),
        //     Expanded(child:  Text(secilenBurc.burcDetayi)),
        //   ],
        // ),
        )
    );
  }
  void appbarRengiBul()async{
  _paletteGenerator = await PaletteGenerator.fromImageProvider(AssetImage('assets/images/${widget.secilenBurc.burcBuyukResim}'));
  appbarRengi = _paletteGenerator.dominantColor!.color;
  setState(() {
    
  });
}
}
