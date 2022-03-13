import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'package:provider/provider.dart';
import 'package:repaire_for_me/screens/details_screen.dart';

class ServiceCard extends StatefulWidget {
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

          pushNewScreen(
            context,
            screen: DetailsScreen(),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(32),
        ),
        child: Container(
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  buildImage(),
                  buildTitle(),
                  buildRating(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      height: MediaQuery.of(context).size.width / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        child: Image.asset(
          'assets/images/Electerricety_1.png',
          fit: BoxFit.cover,
/*          loadingBuilder: (context, Widget child, ImageChunkEvent progress) {
            if (progress == null) return child;
            return Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes : null),
              ),
            );
          },*/
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Electerricety',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              color: const Color(0xff111749),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildRating() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RatingBar(
              initialRating: 2.5,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 24,
              unratedColor: Colors.white38,
              allowHalfRating: true,
              ignoreGestures: true,
              itemBuilder: (context, index) =>
                  Icon(Icons.star, color: Color(0xff5CB441)),
              onRatingUpdate: (rating) {},
            ),
          ],
        ),
      ),
    );
  }

/* Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\$ ${food.price}',
            style: titleStyle,
          ),
          Card(
            margin: EdgeInsets.only(right: 0),
            shape: roundedRectangle4,
            color: mainColor,
            child: InkWell(
             // onTap: addItemToCard,
              splashColor: Colors.white70,
              customBorder: roundedRectangle4,
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }*/
/*
  addItemToCard() {
    bool isAddSuccess = Provider.of<MyCart>(context).addItem(CartItem(food: food, quantity: 1));

    if (isAddSuccess) {
      final snackBar = SnackBar(
        content: Text('${food.name} added to cart'),
        action: SnackBarAction(
          label: 'view',
          onPressed: showCart,
        ),
        duration: Duration(milliseconds: 1500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: Text('You can\'t order from multiple shop at the same time'),
        duration: Duration(milliseconds: 1500),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  showCart() {
    showModalBottomSheet(
      shape: roundedRectangle40,
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }*/
}
