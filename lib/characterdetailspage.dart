
import 'package:flutter/material.dart';

class CharacterDetailsPage extends StatelessWidget {
  final dynamic character;

  CharacterDetailsPage({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(character['image']),
            Divider(
              height: 10,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              //maxLines: flag ? 4 : 500,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Status: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black
                      )),
                  TextSpan(
                      text: '${character['status']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              //maxLines: flag ? 4 : 500,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Species: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black
                      )),
                  TextSpan(
                      text: '${character['species']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              //maxLines: flag ? 4 : 500,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Gender: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black
                      )),
                  TextSpan(
                      text: '${character['gender']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              //maxLines: flag ? 4 : 500,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Origin: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black
                      )),
                  TextSpan(
                      text: '${character['origin']['name']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.left,
              //maxLines: flag ? 4 : 500,
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(text: 'Location: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black
                      )),
                  TextSpan(
                      text: '${character['location']['name']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black
                      )
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}