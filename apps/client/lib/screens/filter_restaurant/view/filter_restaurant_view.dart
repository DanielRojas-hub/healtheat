import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../filter_restaurant.dart';

class FilterRestaurantView extends StatelessWidget {
  const FilterRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0,
      maxChildSize: 0.75,
      expand: false,
      snap: true,
      builder: (BuildContext context, ScrollController controller) {
        return CustomScrollView(controller: controller, slivers: [
          // SliverPadding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
          //   sliver: SliverToBoxAdapter(
          //     child: Stack(
          //       children: <Widget>[
          //         Positioned(
          //           top: 10,
          //           right: 10,
          //           child: IconButton(
          //             icon: const Icon(Icons.restart_alt_sharp),
          //             onPressed: () {
          //               // Agregar la lógica del botón de reinicio aquí
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverPersistentHeader(
            pinned: true,
            delegate: HeaderDelegate(
                maxHeight: 30,
                minHeight: 30,
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(Constants.radiusMedium)),
                backgroundColor:
                    Theme.of(context).bottomSheetTheme.backgroundColor,
                child: const HorizontalScrollBar()),
          ),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(
                child: Text("Categories",
                    style: Theme.of(context).textTheme.titleLarge)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: CategoryWrap()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(
                child: Text("Cuisine",
                    style: Theme.of(context).textTheme.titleLarge)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: CuisineWrap()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(
                child: Text("Menu",
                    style: Theme.of(context).textTheme.titleLarge)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: MenuWrap()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          // SliverPadding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
          //   sliver: SliverToBoxAdapter(
          //       child: Text("Show first",
          //           style: Theme.of(context).textTheme.titleLarge)),
          // ),
          // const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          // const SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
          //   sliver: SliverToBoxAdapter(child: FilterRadio()),
          // ),
          // const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          // const SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
          //   sliver: SliverToBoxAdapter(child: FilterRadio()),
          // ),
          // const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          // const SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
          //   sliver: SliverToBoxAdapter(child: FilterRadio()),
          // ),
          // const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(
                child: ElevatedButton(
                  onPressed: () {
                    final filterState = context.read<FilterBloc>().state;

                    Map<String, String>? queryParameters = {};

                    if (filterState.categoryList.isNotEmpty) {
                      queryParameters['categories'] =
                          filterState.categoryList.join(',');
                    }
                    if (filterState.cuisineList.isNotEmpty) {
                      queryParameters['cuisines'] =
                          filterState.cuisineList.join(',');
                    }
                    if (filterState.menuList.isNotEmpty) {
                      queryParameters['menus'] = filterState.menuList.join(',');
                    }

                    context.pop(queryParameters);
                  },
                  child: const Text("Apply Settings"),
                ),
              )),
        ]);
      },
    );
  }
}
