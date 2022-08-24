import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/services/api_services.dart';
import 'package:google_clone/widget/search_header.dart';
import 'package:google_clone/widget/search_results_components.dart';
import 'package:google_clone/widget/search_tabs.dart';
import '../widget/search_footer.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key,
  required this.searchQuery,
    required this.start,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WEB HEADER
              SearchHeader(),


              // TABS FO NEWS, IMAGES ETC
               Padding(
                padding:  EdgeInsets.only(left: size.width <=786? 10: 150),
                child: const SearchTabs(),
              ),

              Divider(height: 0, thickness: 0.3,),

              // SEARCH RESLUTS
              FutureBuilder(
                future: ApiService().fetchData(queryTerm: searchQuery, start: start ),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // SHOW TIME AND RESULTS ON TOP
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width <=786? 10: 150,
                              top: 12,
                          ),
                          child:Text('About ${snapshot.data? ['searchInformation']['formattedTotalResults']} results  (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)' ,
                          style: TextStyle(fontSize: 15, color: Color(0xff70747A)),
                          ),
                        ),

                        // SHOW RESULT
                        ListView.builder(
                          itemCount: snapshot.data['items'].length,
                            shrinkWrap : true,
                            itemBuilder: (context, index){
                              return Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width <=786? 10: 150,
                                      top: 10),


                              child: SearchResultComponent(
                                description: snapshot.data['items'][index]['snippet'],
                                link: snapshot.data['items'][index]['formattedUrl'],
                                text: snapshot.data['items'][index]['title'],
                                linkToGo: snapshot.data['items'][index]['link'],
                              ),
                              );
                            }
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator(),);
                  },
              ),


              // PAGINATION BUTTONS
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                          if(start != '0'){

                            // GET US PREVIOUS 10 RESULTS
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SearchScreen(
                                start: (int.parse(start)-10).toString(),
                                searchQuery: searchQuery,),
                                ),
                            );
                          }
                          // AND IF START IS 0 THEN DONT DO ANYTHING
                        },
                        child: Text(' < Prev',
                          style: TextStyle(fontSize: 15, color: blueColor),),
                    ),

                    SizedBox(width: 30,),
                    TextButton(
                      onPressed: (){
                        // SHOW NEXT 10 RESULTS
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(
                              start: (int.parse(start)+10).toString(),
                                searchQuery: searchQuery,
                                ),),);
                      },
                      child: Text(' Next >',
                        style: TextStyle(fontSize: 15, color: blueColor),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              // SEARCH FOOTER
              SearchFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
