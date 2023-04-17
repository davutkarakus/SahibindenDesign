
import 'package:flutter/material.dart';
import 'package:flutter_sahibinden_clone/constant/colors.dart';
import 'package:flutter_sahibinden_clone/entity/Kategoriler.dart';

class MainPage extends StatelessWidget {
  Future<List<Kategoriler>> kategorileriGetir() async{
    var kategoriListesi = <Kategoriler>[];
    var k1 = Kategoriler(kategori_id: 1, kategori_ad: "Emlak", kategori_fotograf: "emlak.png", kategori_icerik: "Konut, İş Yeri, Arsa, Konut Projeleri, Bin...");
    var k2 = Kategoriler(kategori_id: 2, kategori_ad: "Vasıta", kategori_fotograf: "vasita.png", kategori_icerik: "Otomobil, Arazi, SUV & Pickup, Motosikl...");
    var k3 = Kategoriler(kategori_id: 3, kategori_ad: "Yedek Parça, Aksesuar, Dona...", kategori_fotograf: "Yedek.png", kategori_icerik: "Otomotiv Ekipmanları, Motosiklet Ekip...");
    var k4 = Kategoriler(kategori_id: 4, kategori_ad: "İkinci El ve Sıfır Alışveriş", kategori_fotograf: "ikinciel.png", kategori_icerik: "Param Güvende Bilgisayar, Cep Telef...");
    var k5 = Kategoriler(kategori_id: 5, kategori_ad: "İş Makineleri & Sanayi", kategori_fotograf: "ismakinesi.png", kategori_icerik: "İş Makineleri, Tarım Makineleri, Sanayi...");
    var k6 = Kategoriler(kategori_id: 6, kategori_ad: "Ustalar ve Hizmetler", kategori_fotograf: "usta.png", kategori_icerik: "Ev Tadilat & Dekorasyon, Nakliye, Araç...");
    var k7 = Kategoriler(kategori_id: 7, kategori_ad: "Özel Ders Verenler", kategori_fotograf: "ozelders.png", kategori_icerik: "Lise & Üniversite, İlkokul & Ortaokul, Ya...");
    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k4);
    kategoriListesi.add(k5);
    kategoriListesi.add(k6);
    kategoriListesi.add(k7);

    return kategoriListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sahibinden.com",style: TextStyle(fontSize: 22),),
        backgroundColor: bgColor,
        actions: [
          SizedBox(width:20,height:20,child: Image.asset("resimler/insan.png")),
          SizedBox(width: 30,),
          SizedBox(width:30,height:30,child: Image.asset("resimler/carcam.png")),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Container(

            child:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black12), //<-- SEE HERE
                    ),
                  hintText: "Kelime veya ilan No. ile ara",
                  hintStyle: TextStyle(fontSize: 18,color: Colors.black54),

                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mic_none,color: Colors.black54,),
                      SizedBox(width: 7,),
                      Icon(Icons.qr_code,color: Colors.black54,),
                      SizedBox(width: 10,),
                    ],
                  ),
                  prefixIcon: Icon(Icons.search,color: Colors.black38,)
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12,width: 0.1),
              color: araColor,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Kategoriler>>(
                future: kategorileriGetir(),
                builder: (context,snapshot) {
                  if(snapshot.hasData){
                    var kategoriList = snapshot.data;
                    return ListView.builder(
                        itemCount: kategoriList!.length,
                        itemBuilder: (context,indeks){
                          var kategori = kategoriList[indeks];
                          return SizedBox(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 40,height: 40,child: Image.asset("resimler/${kategori.kategori_fotograf}")),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(kategori.kategori_ad),
                                              Text(kategori.kategori_icerik),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: (){

                                              },
                                              icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black38,)),
                                        ],
                                      ),
                                    ),
                                    Container(width: 350,height: 0.4,color: Colors.black12,),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  }else {
                    return Center();
                  }
                },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text("Başlık"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: bgColor,
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
