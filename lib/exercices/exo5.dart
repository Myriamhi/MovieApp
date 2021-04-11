import 'package:dwmgex/firebase.dart';
import 'package:flutter/material.dart';

class CarouselImages extends StatefulWidget {
  CarouselImages({
    Key key,
  }) : super(key: key);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to our Cinema',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(
            height: 25,
          ),
          FutureBuilder(
              future: getMovies(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  default:
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, '/detail',
                                    arguments: snapshot.data[index]),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[400],
                                            blurRadius: 4,
                                            offset: Offset(
                                              0.0,
                                              4,
                                            ),
                                          )
                                        ],
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data[index].poster),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 520,
                                    width: 375,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(snapshot.data[index].title,
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                              Text(snapshot.data[index].year,
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white)),
                              Text(snapshot.data[index].kind.toString(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white)),
                            ],
                          );
                        },
                      ),
                    );
                }
              }),
        ],
      ),
    ));
  }
}