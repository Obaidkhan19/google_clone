import 'package:flutter/material.dart';
import 'package:google_clone/widget/web/button.dart';


class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // THERE WILL BE ROW IN THE CENTER
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // AGAIN ROW WHERE WE WILL HAVE BUTTONS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // BUTTON
            Button(title: 'Google Search'),
            SizedBox(width: 10,),
            Button(title: 'i\'m feeling lucky'),
          ],
        )
      ],
    );
  }
}
