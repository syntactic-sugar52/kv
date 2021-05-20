import 'package:flutter/material.dart';

class CoverItem extends StatelessWidget {
  final bool isBig;
  final bool isArtist;

  const CoverItem({
    Key key,
    this.isBig,
    this.isArtist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = isBig ? 180 : 140;
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: size,
      // height: size,
      child: Column(
        crossAxisAlignment:
            isArtist ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: isArtist
                  ? BorderRadius.circular(size)
                  : BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.vuelio.com%2Fuk%2Fwp-content%2Fuploads%2F2020%2F01%2FTop-10-Vlog-ranking-feature-image.png&f=1&nofb=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 8,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "kd",
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Banana boat',
            style: TextStyle(
              color: Colors.white,
              // fontFamily: 'Proxima Nova',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
