import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/color.dart';
import '../../../core/theme/style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/books_page_controller.dart';

class BooksPageView extends GetView<BooksPageController> {
  const BooksPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Text(
          "Books",
          style: Styles.normal(
            20,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_BOOK_PAGE);
            },
            icon: Icon(
              Icons.add_box,
              color: AppColors.black,
              size: 30,
            ),
          )
        ],
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(2, (index) {
            return SlideMenu(
              menuItems: <Widget>[
                Container(
                  color: Colors.black12,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ),
              ],
              child: const ListTile(
                title: Text("Edit Book"),
              ),
            );
          }),
        ).toList(),
      ),
    );
  }
}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  const SlideMenu({Key? key, required this.child, required this.menuItems})
      : super(key: key);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(-0.2, 0.0))
            .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    return GestureDetector(
      onHorizontalDragUpdate: (data) {
        setState(() {
          _controller.value -=
              (data.primaryDelta! / (context.size!.width * 0.2));
        });
      },
      onHorizontalDragEnd: (data) {
        if (data.primaryVelocity! > 1500) {
          _controller.animateTo(.0);
        } else if (_controller.value >= .5 || data.primaryVelocity! < -1500) {
          _controller.animateTo(1.0);
        } else {
          _controller.animateTo(.0);
        }
      },
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: [
              SlideTransition(
                position: animation,
                child: widget.child,
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    right: .0,
                    top: .0,
                    bottom: .0,
                    width: constraint.maxWidth * animation.value.dx * -1,
                    child: Row(
                      children: widget.menuItems.map((child) {
                        return Expanded(
                          child: child,
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
