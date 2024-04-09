import 'package:flutter/material.dart';
import 'package:tehno_mir/core/constants/sizes/app_text_size.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton(this.title, {super.key, this.onTap});

  final String title;
  final   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: 60,
        //width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          //  border: Border.all(color: searchGaranty),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              maxLines:1 ,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black26),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.arrow_forward_ios,size: 20,
              ///  color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileWidget extends StatelessWidget {
  const ProfileWidget(this.title, {super.key, this.onTap, this.widget,this.marginHorizontal,this.marginVertical, this.paddingLeft, this.paddingRight, this.paddingTop, this.paddingBottom});

  final String title;
  final   void Function()? onTap;
  final Widget? widget;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? marginVertical;
  final double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.symmetric(vertical:marginVertical?? 5,horizontal:marginHorizontal?? 10),
        padding:  EdgeInsets.fromLTRB(paddingLeft??10, paddingTop??0, paddingRight??10, paddingBottom??0),
        height: 60,
        //width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          //  border: Border.all(color: searchGaranty),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
              maxLines:1 ,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black26),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}

