import 'package:flutter/material.dart';
import 'package:google_clone/widget/search_tab_widget.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          // SEARCH TAB = bcz we have same search tab just icon change
          SearchTabWidget(
            isActive: true,
            text: 'All',
            icon: Icons.search,
          ),
          SizedBox(width: 20,),

          SearchTabWidget(
            text: 'Images',
            icon: Icons.image,
          ),

          SizedBox(width: 20,),
          SearchTabWidget(
            text: 'Map',
            icon: Icons.map,
          ),
          SizedBox(width: 20,),

          SearchTabWidget(
            text: 'News',
            icon: Icons.article,
          ),
          SizedBox(width: 20,),

          SearchTabWidget(
            text: 'Shopping',
            icon: Icons.shop,
          ),
          SizedBox(width: 20,),

          SearchTabWidget(
            text: 'More',
            icon: Icons.more_vert,
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
