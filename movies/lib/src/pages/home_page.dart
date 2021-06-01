import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key home}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [_swiperCards()],
        ),
      ),
    );
  }

  _swiperCards() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity, //Utiliza todo el ancho posible
      height: 300.0,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: 300.0,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "https://dummyimage.com/600x400/000/fff",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
