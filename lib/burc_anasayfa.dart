import 'package:flutter/material.dart';

import 'burc_detay.dart';
import 'model/burc.dart';

class BurcAnasayfa extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcAnasayfa({required this.listelenenBurc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BurcDetay(
                            tiklanilanBurc: listelenenBurc,
                          )));
            },
            leading: Image.asset(
              "images/" + listelenenBurc.burcKucukResim,
            ),
            title: Text(listelenenBurc.burcAdi),
            subtitle: Text(listelenenBurc.burcTarihi),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
