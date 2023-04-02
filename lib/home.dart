import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'characterdetailspage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _search = new TextEditingController();
  List<dynamic> _characters=[];
  List<dynamic> _searchcharacters=[];

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }
  Future<void> _fetchCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _characters = data['results'];
      });
    } else {
      throw Exception('Failed to fetch characters');
    }
  }

  void filter_characters(){
    String searchtext=_search.text.toLowerCase();
    _searchcharacters.clear();
    _characters.forEach((character) {
      if (character['name'].toLowerCase().contains(searchtext) || character['status'].toLowerCase().contains(searchtext)) {
        _searchcharacters.add(character);
      }
    });
    setState(() {
      _searchcharacters;
    });
  //  print(_searchcharacters);
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Rick and Morty Characters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
        child:
        Container(
          height: size.height*1,
          width: size.width*1,
          child: Column(
            children: [
              Container(
                  height: size.height*0.1,
                  color: Colors.white,
                  // color: Colors.grey[200],
                  padding: EdgeInsets.all( 10.0),
                  child:
                  Container(
                      child:  TextField(
                        controller: _search,
                        onChanged: (value){
                          filter_characters();
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Search/Filter",
                            suffixIcon:Container(
                              height: size.height*0.1,
                              child:GestureDetector(
                                  onTap: (){
                                    filter_characters();
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  )),
                              decoration: BoxDecoration(
                                color:Colors.pink,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0) //                 <--- border radius here
                                ),
                              ),
                            )
                        ),
                      ))
              ),
              Container(
                height: size.height*0.8,
                width: size.width*1,
                child:_characters == null
                    ? Center(child: CircularProgressIndicator())
                    :
                _search.text.isEmpty?
                ListView.builder(
                  itemCount: _characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    final character = _characters[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.network(character['image']),
                          title: Text(character['name']),
                          subtitle: Text(character['status']),
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => CharacterDetailsPage(character: character),
                            ),
                            );
                          },
                         ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                ):
                _searchcharacters.length > 0?
                ListView.builder(
                  itemCount: _searchcharacters.length,
                  itemBuilder: (BuildContext context, int index) {
                    final character = _searchcharacters[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.network(character['image']),
                          title: Text(character['name']),
                          subtitle: Text(character['status']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CharacterDetailsPage(character: character),
                              ),
                            );
                          },
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                ):Container(
                 height: size.height*0.8,
                  child: Center(
                    child: Text(
                      "No Search Data",
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        )
    );
  }
}
