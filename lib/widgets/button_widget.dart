import 'package:flutter/material.dart';
import 'package:kv/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(18),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyanAccent,
            elevation: 5,
            // primary: Color.fromRGBO(29, 194, 95, 1),
            minimumSize: Size.fromHeight(40),
          ),
          child: buildContent(),
          onPressed: onClicked,
        ),
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: kBlack,
          ),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: kBlack),
          ),
        ],
      );
}
