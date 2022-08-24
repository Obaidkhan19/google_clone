import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class SearchTabWidget extends StatelessWidget {

  final IconData icon;
  final bool isActive;
  final String text;
  const SearchTabWidget({Key? key,
    
    required this.icon,
    this.isActive = false,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? blueColor : Colors.grey,
            ),
            SizedBox(width: 3,),
            Text(text, style: TextStyle(fontSize: 15, color: isActive ? blueColor : Colors.grey ),),
          ],
        ),
        SizedBox(height: 7,),

        isActive ? Container(
          height: 3,
          width: 40,
          color: blueColor,
        ) : Container(),
      ],
    );
  }
}
