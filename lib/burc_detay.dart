import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc tiklanilanBurc;
  const BurcDetay({required this.tiklanilanBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRenk = Colors.transparent;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    //önemli build çakışmasını önlüyor ve daha hızlı çalışmasını sağlıyor,
    WidgetsBinding.instance!.addPostFrameCallback((_) => appBarRengiBul());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRenk,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  Text(widget.tiklanilanBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                "images/" + widget.tiklanilanBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      widget.tiklanilanBurc.burcTarihi,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.tiklanilanBurc.burcDetayi,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRengiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.tiklanilanBurc.burcBuyukResim}'));
    appBarRenk = _generator.dominantColor!.color;
    setState(() {});
  }
}
