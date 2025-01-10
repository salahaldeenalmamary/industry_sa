import 'package:appriverpod/app/core/extensions/indext.dart';
import 'package:appriverpod/config/translations/localization_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/home/BannerModel.dart';
import '../../../../data/models/home/sliderModel.dart';
import '../../../../widget/CarouselSlider.dart';
import '../../../../widget/custom_image_view.dart';
import '../../providers/home_providers.dart';
import '../../providers/state/HomeState.dart';
import '../widgets/FilterSegmentedControl.dart';
import '/app/core/base/base_view.dart';
import '../widgets/CategoryListView.dart';
import '../widgets/FeaturedBrandWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product.dart';
import '../widgets/sectionTitle.dart';

class HomeView extends BaseView {
  @override
  Widget? loadingBuilder(WidgetRef ref) {
    super.loadingBuilder(ref);
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  void onRefreshIndicator(WidgetRef ref) async {
    await ref.read(homeNotifierProvider.notifier).fetchCategoryData();
    super.onRefreshIndicator(ref);
  }

  @override
  void onRetry(WidgetRef ref) {
    ref.read(homeNotifierProvider.notifier).fetchCategoryData();
    super.onRetry(ref);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);

    return PageStateRender(
      state.pageState,
      ref,
      child: CustomScrollView(
        slivers: [
          _buildRefreshControl(ref),
           SizedBox(
            height: 7,
          ).sliverBox,
          if (state.data?.slider != null)
            _buildSlider(state.data!.slider!.main),
            _buildSectionTitle(context.l10n.bottomNavCategories),
          _buildFeaturedCategories(state),
          if (state.data?.banners != null)
            _buildCarouselSlider(state.data!.banners!),
          SizedBox(
            height: 7,
          ).sliverBox,
           _buildSectionTitle(context.l10n.offers),
          _buildDealsFilter(state, ref),
          SizedBox(
            height: 2,
          ).sliverBox,
          _buildProductGrid(state),
          SizedBox(
            height: 2,
          ).sliverBox,
          _buildSectionTitle('Featured Brands'),
          SizedBox(
            height: 2,
          ).sliverBox,
          _buildFeaturedBrands(state),
          _buildImageSlider(state, 5),
          _buildCollections(state),
          _buildImageSlider(state, 6),
          _buildNewsProducts(state),
        ],
      ),
    );
  }

  Widget _buildImageSlider(HomeState state, int type) {
    if (state.data?.banners == null) return SizedBox().sliverBox;
    return CustomImageView(
      
            imagePath: state?.data?.banners
                ?.where((e) => e.image != null && e.type == type)
                .map(
                  (e) => e.smallImage!,
                )
                .firstOrNull)
        .sliverBox;
  }

  Widget _buildRefreshControl(WidgetRef ref) {
    return CupertinoSliverRefreshControl(
      onRefresh: () async {
        onRefreshIndicator(ref);
      },
    );
  }

  Widget _buildCarouselSlider(List<BannerModel> banners) {
    final imageUrls = banners
        .where((e) => e.image != null && [2, 3, 4].contains(e.type))
        .map((e) => e.smallImage!)
        .toList();
    return CustomCarouselSlider(
      imageUrls: imageUrls,
      height: 150,
    ).sliverBox;
  }

  Widget _buildFeaturedCategories(HomeState state) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.data?.featuredCategories?.length ?? 0,
                itemBuilder: (context, index) {
                  final category = state.data!.featuredCategories?[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SizedBox(
                      child: FeaturedCategoryWidget(category: category!),
                      width: MediaQuery.of(context).size.width/3,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(List<SliderMainModel> slider) {
    final imageUrls = slider.map((e) => e.image!).toList();
    return CustomCarouselSlider(
      imageUrls: imageUrls,
      height: 170,
      autoPlay: false,
    ).sliverBox;
  }

  Widget _buildDealsFilter(HomeState state, WidgetRef ref) {
    return FilterChoiceTaps(

      categories: state.data?.deals ?? [],
      onCategorySelected: (selectedCategory) async {
        ref
            .read(homeNotifierProvider.notifier)
            .handleSelectedDeal(selectedCategory);
      },
      selectedCategory: state.selectedDeal,
    ).sliverBox;
  }

  Widget _buildProductGrid(HomeState state) {
    final products = state.selectedDeal?.products;
    if (products == null || products.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox(),
      );
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 310,
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return SizedBox(
              width: 200,
              child: ProductWidget(product: product)
                  .paddingOnly(left: 4, right: 2),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return SectionTitle(title: title).sliverBox;
  }

  Widget _buildFeaturedBrands(HomeState state) {
    return Container(
      height: 100,
      padding: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        padding: const EdgeInsets.all(3),
        scrollDirection: Axis.horizontal,
        itemCount: state.data?.featuredBrands?.length ?? 0,
        itemBuilder: (context, gridIndex) {
          final brand = state.data?.featuredBrands?[gridIndex];
          return SizedBox(
            child: FeaturedBrandWidget(brand: brand!),
            width: 100,
          );
        },
      ),
    ).sliverBox;
  }

  Widget _buildCollections(HomeState state, {int ?type}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          final item = state.data?.collections?[index];
          if (item == null || item.productCollections.isEmpty) {
            return SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: item.title),
              Container(
                height: 330,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  scrollDirection: Axis.horizontal,
                  itemCount: item.productCollections?.length ?? 0,
                  itemBuilder: (context, gridIndex) {
                    final product = item.productCollections?[gridIndex];
                    return SizedBox(
                      child: ProductWidget(product: product)
                          .paddingOnly(left: 4, right: 2),
                      width: 200,
                    );
                  },
                ),
              ),
            ],
          );
        },
        childCount: state.data?.collections?.length ?? 0,
      ),
    );
  }

  Widget _buildNewsProducts(HomeState state, {int ?type}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, index) {
          final item = state.data?.collections?[index];
          if (item == null || item.productCollections.isEmpty) {
            return SizedBox.shrink();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(title: item.title),
              Container(
                height: 325,
                padding: const EdgeInsets.only(bottom: 8),
                child: ListView.builder(
                  padding: const EdgeInsets.all(3),
                  scrollDirection: Axis.horizontal,
                  itemCount: item.productCollections?.length ?? 0,
                  itemBuilder: (context, gridIndex) {
                    final product = item.productCollections?[gridIndex];
                    return SizedBox(
                      child: ProductWidget(product: product)
                          .paddingOnly(left: 4, right: 2),
                      width: 200,
                    );
                  },
                ),
              ),
            ],
          );
        },
        childCount: state.data?.collections?.length ?? 0,
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {}
}
