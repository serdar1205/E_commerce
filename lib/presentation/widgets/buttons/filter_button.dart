import 'package:flutter/material.dart';

import '../../../core/constants/colors/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.element, required this.press, required this.isSearch});

  final String element;
  final VoidCallback press;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: press,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor:
              MaterialStateProperty.all(
              isSearch ? Theme.of(context).cardColor : AppColors.curnil,

              )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            element,
            style:  TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14,
                color: isSearch ? Theme.of(context).primaryTextTheme.bodyMedium!.color : Colors.white),
          ),
          isSearch
              ? IconButton(
                  onPressed: () {},
                  icon:  Icon(
                    Icons.close,
                    color: Theme.of(context).iconTheme.color,
                    size: 20,
                  ))
              : Container(),
        ],
      ),
    );
  }
}
