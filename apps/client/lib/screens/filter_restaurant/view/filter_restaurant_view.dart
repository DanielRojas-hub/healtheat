import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(
                child: Text("Show first",
                    style: Theme.of(context).textTheme.titleLarge)),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: FilterRadio()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: FilterRadio()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            sliver: SliverToBoxAdapter(child: FilterRadio()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ]);
      },
    );
  }
}
