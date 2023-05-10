import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: PersistentHeaderDelegate(
        title: 'PRINCIPAL',
        subTitle: '1800',
        maxExtend: const Size.fromHeight(kToolbarHeight).height * 2,
        minExtend: const Size.fromHeight(kToolbarHeight).height,
      ),
    );
  }
}

class PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  PersistentHeaderDelegate({
    required this.title,
    required this.subTitle,
    required this.maxExtend,
    required this.minExtend,
  });

  final String title;
  final String subTitle;
  final double maxExtend;
  final double minExtend;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final newValue = maxExtend - shrinkOffset;
    final delta = newValue / maxExtend;
    // final teta = shrinkOffset / maxExtend;

    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(delta * 30),
            bottomLeft: Radius.circular(delta * 30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: minExtend,
                            child: const Icon(Icons.menu),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/selectAccount');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: SizedBox(
                      height: minExtend,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title),
                          const Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: SizedBox(
                    height: minExtend,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(subTitle),
                      ],
                    ),
                  ),
                ),
              ),
            )

            // Row(
            //   children: [
            //     Flexible(
            //         fit: FlexFit.tight, flex: 20, child: Icon(Icons.menu)),
            //     Flexible(
            //       fit: FlexFit.tight,
            //       flex: 80,
            //       child: Text('como estas'),
            //     )
            //   ],
            // ),
            // Positioned(
            //   child: Text(title),
            // ),
          ],
        )
        // Center(
        //   child: Transform.scale(
        //     scale: delta,
        //     child: Opacity(
        //       opacity: delta,
        //       child: Text(
        //         'shrinkOffset: ${shrinkOffset.toStringAsFixed(0)} \n '
        //         'teta: ${teta.toStringAsFixed(1)} \n'
        //         'tmp1: ${newValue.toStringAsFixed(0)} \n'
        //         'tmp2: $maxExtend delta: ${delta.toStringAsFixed(1)} \n',
        //       ),
        //     ),
        //   ),
        // ),
        ,
      ),
    );
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
