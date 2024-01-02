import 'package:flutter/material.dart';
import 'package:nothesapla/constants/app.constants.dart';
import 'package:nothesapla/helper/data_helper.dart';
import 'package:nothesapla/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({required this.onElemanCikarildi, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEkleneneDersler;
    return tumDersler.length > 0 ? ListView.builder(itemCount: tumDersler.length, itemBuilder:  (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
         onElemanCikarildi(index);
          
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text((tumDersler[index].harfDegeri * tumDersler[index].krediDegeri).toStringAsFixed(0)),
              ),
              subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
            ),
          ),
        ),
      );
    }): Container(child: Center(child: Text('Lütfen Ders Ekleyin',style: Sabitler.baslikStyle,)),);
  }
}