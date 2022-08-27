import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_flutter/TestRestApi/RestaurantModel.dart';
import 'package:course_flutter/TestRestApi/ResturantsProvider.dart';
import 'package:course_flutter/UI/HomePage(1,2,3).dart/ImageList2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailRestaurants extends StatefulWidget {
  // var location_id ;
  // final List<Data> typehead1 ;
  DetailRestaurants({Key? key, }) : super(key: key);

  @override
  State<DetailRestaurants> createState() => _DetailRestaurantsState();
}

class _DetailRestaurantsState extends State<DetailRestaurants> {
  final RestaurantProivder restaurantProivder = RestaurantProivder();
  // late Future _searchDetailData;
//  late Future _searchtypeheaddata;
  // late Future _searchrevwies ;
  // Future getDetailData() async {
  //   await restaurantProivder.getDeatil();
  // }

  // Future getTypeheadeData() async {
  //   await restaurantProivder.getTypeHead().toString();
  // }
  // Future getReviews() async{
  //   await restaurantProivder.getReviews();
  // }
  void initState() {
    // _searchDetailData = getDetailData();
    // _searchtypeheaddata = getTypeheadeData();
    // _searchrevwies = getReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (() {
              Navigator.of(context).pop();
            }),
          ),
          toolbarHeight: 55,
          backgroundColor: Color.fromRGBO(50, 183, 104, 30),
          centerTitle: true,
          title: Text(
            'Detail Restaurants',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              restaurantProivder.isLoading
                  ? const Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : FutureBuilder(
                      future: restaurantProivder.getTypeHead(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: restaurantProivder.typeHead.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(restaurantProivder.typeHead
                                          .toString())),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color:
                                              Color.fromRGBO(50, 183, 104, 50),
                                          size: 15.0,
                                        ),
                                        // Text(
                                        //   restaurantProivder
                                        //       .typeHead.location_id,
                                        //   style: TextStyle(
                                        //       fontSize: 10.0,
                                        //       color: Color.fromRGBO(
                                        //           107, 114, 128, 107)),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  // Container(
                                  //   padding:
                                  //       EdgeInsets.symmetric(horizontal: 15.0),
                                  //   width: MediaQuery.of(context).size.width,
                                  //   height: 170.0,
                                  //   alignment: Alignment.center,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.only(
                                  //           topLeft: Radius.circular(18.0),
                                  //           topRight: Radius.circular(20.0)),
                                  //       image: DecorationImage(
                                  //           image: NetworkImage(
                                  //               restaurantProivder
                                  //                   .typeHead.photo
                                  //                   .toString()),
                                  //           fit: BoxFit.cover)),
                                  // )
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
              SizedBox(
                height: 40.0,
              ),
              FutureBuilder(
                future: restaurantProivder.getReviews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurantProivder.review.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Row(
                          children: [
                            Text(
                              restaurantProivder.review[index].text.toString(),
                              style: TextStyle(
                                color: Color.fromRGBO(50, 183, 104, 50),
                              ),
                            )
                          ],
                        ));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          elevation: 20.0,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 90.0, right: 90.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(child: Text('Booking'), onPressed: () {}),
            ),
          ),
        ));
  }
}
// Imageurl
// "https://firebasestorage.googleapis.com/v0/b/courseflutter-2b82f.appspot.com/o/FoodImages3%2FPhoto%2001.png?alt=media&token=4c77bad0-885d-4d0c-8d7e-06b4ba236185"
// Name
// "Chicken Biryani"
// address
// "Kazi Deiry , Taiger Pass Chittagong"

class DetailRestaurants1 {
  String? Imageurl;
  String? Name;
  String? address;
  DetailRestaurants1(this.Imageurl, this.Name, this.address);
  DetailRestaurants1.fromJson(Map<String, dynamic> json)
      : Imageurl = json['Imageurl'],
        Name = json['Name'],
        address = json['address'];
  Map<String?, dynamic> toJson() =>
      {Imageurl: this.Imageurl, Name: this.Name, address: this.address};
}

class GetDetailRestaurants1 with ChangeNotifier {
  List<DetailRestaurants1> RecievedDetailRestaurants1 = [];
  void setImage(List<DetailRestaurants1> revieveddetailrestaurant1) {
    this.RecievedDetailRestaurants1 = revieveddetailrestaurant1;
    //here
    notifyListeners();
    //there
  }

  Future<void> GetDetailedRestaurants1() async {
    List<DetailRestaurants1> FinalRecievedDetailRestaurants1 = [];
    var firebasefirestore4 =
        FirebaseFirestore.instance.collection('Detail Restaurants 1');
    QuerySnapshot<Map<String, dynamic>> response4 =
        await firebasefirestore4.get();
    response4.docs.forEach((e) => {
          FinalRecievedDetailRestaurants1.add(
              DetailRestaurants1.fromJson(e.data()))
        });
    setImage(FinalRecievedDetailRestaurants1);
  }
}
