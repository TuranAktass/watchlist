import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String dersNo = '3301456';
  final String ogrNo = '183311092';
  final String tarih = '25 Haziran 2021';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About')),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Center(
              child: Text(
                  'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen $dersNo kodlu MOBİL PROGRAMLAMA dersi kapsamında $ogrNo numaralı Öğrenci Öğrenir tarafından $tarih günü yapılmıştır.	',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'Arvo'))),
        ));
  }
}
