import 'package:flutter/material.dart';

class SliverAppBarItem extends StatefulWidget {
  String location;
  String imageUrl;

  SliverAppBarItem({Key? key, required this.location, required this.imageUrl})
      : super(key: key);

  @override
  State<SliverAppBarItem> createState() => _SliverAppBarItemState();
}

class _SliverAppBarItemState extends State<SliverAppBarItem> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      collapsedHeight: 80,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        expandedHeight: 200.0,
        backgroundColor: Colors.blue,
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: EdgeInsets.only(right: 15,left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text('${widget.location.substring(0,12)}',style: TextStyle(color: Colors.black,fontSize:24),)],
            ),
          ),
          background: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            child: Image.network(
              "https://cdn.countryflags.com/thumbs/${widget.imageUrl.toLowerCase().replaceAll(" ", '-')}/flag-square-250.png",
              fit: BoxFit.fill,

            ),
          ),
        ),
      
    );

  }
}
