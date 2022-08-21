import 'package:flutter/material.dart';

class MajorBox extends StatelessWidget {
  const MajorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 175,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      "Madhavam Shahi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.blue,
                    ),
                    child: Text(
                      "Maths",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50,
              right: 16,
              left: 16,
              child: Container(
                width: 150,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/illus6.png")),
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
