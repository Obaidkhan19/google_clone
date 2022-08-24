import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';

class FooterText extends StatelessWidget {
  final String title;
  const FooterText({Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
        child: Text(title,
        style: TextStyle(color:Color(0xff70757A)),
        ),
    );
  }
}
