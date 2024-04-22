import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback tap;
   SecondaryButton({super.key, required this.icon, required this.tap, required this.iconSize});
 
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 110),

      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(5),

        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
        BoxShadow(
        color: Colors.white12,
        spreadRadius:0.3,
        blurRadius: 1,
        offset: Offset(-3,-3),
      // changes position of shadow
            ),
          ],
        ),
        child: Icon(icon,color: Colors.white,size: iconSize,),
      ),
    );
  }
}



class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback tap;
  const PrimaryButton({super.key, required this.buttonName, required this.tap});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: tap,
      duration: Duration(milliseconds: 110),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 45,vertical: 10),

        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.white12,
              spreadRadius:0.3,
              blurRadius: 1,
              offset: Offset(-3,-3),
              // changes position of shadow
            ),
          ],
        ),
        child: Text("${buttonName}",
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFD9896A).withOpacity(0.6),
          fontWeight: FontWeight.w500

        ),),
      ),
    );
  }
}

