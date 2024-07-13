import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/models/category_model.dart';
import 'package:flutter_application/models/popular_model.dart';
import 'package:flutter_application/models/recomendations_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Home extends StatelessWidget {

  List<Categories> categories = [];
  List<RecomendationsModel> recomendation_model= [];
  List<PopularDietsModel> popular_diet_model =  [];
  Home({super.key});

  void _getCategories(){
    categories = Categories.getCategory();
  }

  void _getRecomendations(){
    recomendation_model = RecomendationsModel.getRecomendationModel();
  }

   void _getPopular(){
    popular_diet_model = PopularDietsModel.getPopularDiets();
  }
  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getRecomendations();
    _getPopular();
    return Scaffold(
        appBar: getAppBar(),
        body: getbody() ,
      );
  }

  AppBar getAppBar(){
    return AppBar(backgroundColor: Colors.white,
      title: const Text("Test App",
        style:TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ) ,
      ),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap:(){},
      child:Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15),
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          color: Colors.lightBlue,
          'assets/svg/left-arrow.svg'
        ) ,
      )),

      actions: [
        GestureDetector(
          onTap: (){},
          child:Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(15),
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          color: Colors.lightBlue,
          'assets/svg/3-dots.svg'
        ) ,
      ))],
    );
  }




  Container getbody() {
    return(
     Container( 
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: ListView(
        children: [
        getSearchBar(),
        const SizedBox(height: 40,),
        getCategoryView(),
        const SizedBox(height: 40,),
        getRecomendations(),
        const SizedBox(height: 40,),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("Popular",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  )),

                  SizedBox(height: 20,),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: popular_diet_model.length,
                    itemBuilder: (context, index){
                      return(
                       Container(
                        margin: EdgeInsets.only(bottom: 60),
                        height: 80,

                         decoration: BoxDecoration(
                          color: popular_diet_model[index].boxIsSelected ?
                          Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: popular_diet_model[index].boxIsSelected ? [
                            BoxShadow(
                              color: const Color(0xff1D1617).withOpacity(0.07),
                              offset: const Offset(0, 10),
                              blurRadius: 40,
                              spreadRadius: 0
                            )]:[]),

                  
                        child:(Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(popular_diet_model[index].iconPath),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Text(popular_diet_model[index].name),

                            IntrinsicHeight( 
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                      Text(recomendation_model[index].level,
                                                      style: const TextStyle(color: Color(0xff7B6F72),
                                                      fontSize: 12),),
                                                      const VerticalDivider(color: Colors.grey,thickness: 1.0,),
                                                      Text(recomendation_model[index].duration,
                                                      style: const TextStyle(color: Color(0xff7B6F72),
                                                      fontSize: 12),),
                                                      const VerticalDivider(color: Colors.grey,thickness: 1.0,),
                                                      Text(recomendation_model[index].calorie,
                                                      style: const TextStyle(color: Color(0xff7B6F72),
                                                      fontSize: 12),),
                                                    ],
                                                  ))




                                ],
                          ),
                          
                        ],

                      ))));
                    },
                  )
                
                  
              ],
          )
    
    ]))
  
);}

Column getRecomendations(){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recomendation for diet",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 200,
          child: ListView.separated(
            itemCount: recomendation_model.length,
            separatorBuilder: (context, index) => SizedBox(width: 25,),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: recomendation_model[index].boxColor,

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                        SvgPicture.asset(
                            recomendation_model[index].iconPath,
                        ),
                      Text(recomendation_model[index].name,
                      style:const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Container(
                        
                      child:IntrinsicHeight( 
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text(recomendation_model[index].level,
                          style: const TextStyle(color: Color(0xff7B6F72),
                          fontSize: 12),),
                          const VerticalDivider(color: Colors.grey,thickness: 1.0,),
                          Text(recomendation_model[index].duration,
                          style: const TextStyle(color: Color(0xff7B6F72),
                          fontSize: 12),),
                          const VerticalDivider(color: Colors.grey,thickness: 1.0,),
                          Text(recomendation_model[index].calorie,
                          style: const TextStyle(color: Color(0xff7B6F72),
                          fontSize: 12),),
                        ],
                      ))),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.blue
                        ),
                        child: const Column (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        children:[Text("View",
                        style: TextStyle(color: Colors.white),
                        )]),
                      )
                    ],
                  ),
              );
            },

          ),

        )

      ],
    );
}

Column getCategoryView(){
  
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [ 
    const Text(
      "Category",
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
    ),
    const SizedBox(height: 10,),
    Container(height: 100,
      child:ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 25,),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Container(
            width: 75,
            decoration:BoxDecoration(
              color:categories[index].color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child:Container(
                          padding: const EdgeInsets.all(5),
                          child:SvgPicture.asset(categories[index].filePath))
                    ),
                    // 
                    Text(categories[index].category),
                  ]

              )
          );
        }))
]);}




Container getSearchBar() {
    return Container(
       
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
          color: const Color(0xff1D1617).withOpacity(0.11),
          blurRadius:40,
          spreadRadius: 0.0
      )],
       ),
        child:  TextField(
          decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          hintText: "Search breakfast",
          hintStyle:const TextStyle(color:Color(0xffDDDADA),
          fontSize: 14),
          prefixIcon:Container(
          padding: const EdgeInsets.all(15),
          
          child:SvgPicture.asset("assets/svg/search.svg",
          width: 10,
          )),
          suffixIcon:Container(
            width:70,
            child:IntrinsicHeight(
          child:Row(   
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
            const VerticalDivider(color: Colors.black,thickness: 0.1,
            indent: 7,
            endIndent: 7,
            ),
            Container(
            padding: const EdgeInsets.all(17),
            child:SvgPicture.asset("assets/svg/customize.svg",color: Colors.blue,) ,
          )])
          )),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
          ),
          filled: true,
          fillColor: Colors.white,  
        ),
      )
  );
  }

}