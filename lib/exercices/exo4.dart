import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 125,
            child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.ionos.fr/digitalguide/fileadmin/DigitalGuide/Teaser/movie-maker-alternative.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Text('STAR MOVIE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white))),
          ),
          ListTile(
            title: Text('Home',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromRGBO(45, 45, 69, 1))),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            title: Text('User',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromRGBO(45, 45, 69, 1))),
            leading: Icon(Icons.person),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          
        ],
      ),
    );
  }
}
