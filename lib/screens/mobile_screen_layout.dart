import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widget/mobile/mobile_footer.dart';
import 'package:google_clone/widget/search.dart';
import 'package:google_clone/widget/translation_button.dart';
import 'package:google_clone/widget/web/search_button.dart';


class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // this size has full size of screen
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
        onPressed: (){},icon : Icon(Icons.menu, color: Colors.grey,)
    ),
    title: SizedBox(
      width: size.width*0.34,
      child: DefaultTabController(length: 2,child: TabBar(
        labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.blue,
      tabs: [ Tab(text: 'All',),Tab(text: 'Images',),],
      ),
      ),
    ),

        // leading (on left)
        // actions( on right)
        actions: [
          IconButton(onPressed: (){},
              icon: SvgPicture.asset('assets/images/more-apps.svg', color: primaryColor,)
          ),

          SizedBox(width: 10,),

          Padding
            (padding: EdgeInsets.symmetric(vertical: 10).copyWith(
            right: 10,
          ),
            child:MaterialButton(
              onPressed: (){},
              color: const  Color(0xff1A73EB),
              child: Text('Sign In' , style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 0, right: 0,), //EdgeInsets.only(left: 5, right: 5,),
        child: Column(
          children: [
            //  0.25 of whole screen in height
            SizedBox(height: size.height *0.25,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      // SEARCH FUNCTION TO SEARCH
                      Search(),
                      SizedBox(height: 20,),

                      // BUTTONS BELOW SEARCH BAR
                      SearchButtons(),
                      SizedBox(height: 20,),

                      // TRANSLATION BUTTONS
                      TranslationButtons(),

                    ],
                  ),
                  // FOOTER
                  MobileFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
