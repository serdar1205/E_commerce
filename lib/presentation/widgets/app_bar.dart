import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tehno_mir/domain/usecases/products/get_product_usecase.dart';
import '../bloc/products/products_cubit.dart';
import 'buttons/icon_container_button.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        titleSpacing: 0,
        elevation: 0,
        title: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              _focusNode.unfocus();
            }
            return true;
          },
          child: Container(
            height: 40,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller:
                  context.read<CategoryProductsCubit>().searchController,
              focusNode: _focusNode,
              onChanged: (val) => setState(() {}),
              onSubmitted: (val) => context
                  .read<CategoryProductsCubit>()
                  .getSearchedProducts(val),
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                prefixIconColor: Colors.black26,
                suffixIcon: _focusNode.hasFocus &&
                        context
                            .read<CategoryProductsCubit>()
                            .searchController
                            .text
                            .isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                            onPressed: () {
                              if (context
                                  .read<CategoryProductsCubit>()
                                  .searchController
                                  .text
                                  .isNotEmpty) {
                                context
                                    .read<CategoryProductsCubit>()
                                    .searchController
                                    .clear();
                              } else {
                                setState(() {
                                  _focusNode.unfocus();
                                });
                                context
                                    .read<CategoryProductsCubit>()
                                    .getProducts(ProductQueryParameters());
                              }
                            },
                            icon: const Icon(Icons.clear)),
                      )
                    : null,
                suffixIconColor: Colors.black26,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ),
        ),
        actions: [
          widget.index == 0
              ? Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    child: IconBackgroundButton(
                      icon: 'Heart.svg',
                      onTap: () {},
                    ),
                  ),
                )
              : Container(),
        ]);
  }
}
