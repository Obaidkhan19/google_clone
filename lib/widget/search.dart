import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this size has full size of screen
    final size = MediaQuery.of(context).size;
    return Column(

      // start of container and center of container
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/images/google-logo.png', height: size.height*0.12,),
        ),
        SizedBox(height: 20,),

        SizedBox(
          
          // CONDITIONS FOR WEB AND MOBILE SEARCH BARS
          
          width: size.width > 768  ? size.width*0.4 :  size.width*0.9,
          child: TextFormField(
            onFieldSubmitted: (query){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(
                  start: '0',
                  searchQuery: query,),));
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: searchBorder,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30,),),
              ),

              // PADDING SVGPICTURE TO DECREASE SIZE OF ICON
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/search-icon.svg',
                  color: searchBorder,
                ),
              ),

              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/images/mic-icon.svg',
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
