import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:url_launcher/url_launcher.dart';


class SearchResultComponent extends StatefulWidget {
  final String link;
  final String text;
  final String linkToGo;
  final String description;

  const SearchResultComponent({Key? key,
    required this.link,
    required this.text,
    required this.linkToGo,
    required this.description,
  }) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {

  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // showing the link at the top first
        Text(widget.link,),

        // showing the text to display as header with link
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async{
              if(await canLaunch(widget.linkToGo)){
                await launch(widget.linkToGo,);
              }
            },
            onHover: (hovering){
             setState(() {
               _showUnderline= hovering;
             });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.link, style: TextStyle(fontSize: 14,color: Color(0xff202124)),),
                Text(widget.text, style: TextStyle(fontSize: 20,color: blueColor,
                    decoration: _showUnderline? TextDecoration.underline : TextDecoration.none,
                ),
                ),
              ],
            ),
          ),
        ),
        Text(widget.description, style: TextStyle(fontSize: 14, color: primaryColor),),
        SizedBox(height: 10),
      ],
    );
  }
}