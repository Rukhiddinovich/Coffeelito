import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeelito/bloc/category/category_bloc.dart';
import 'package:coffeelito/bloc/product/product_bloc.dart';
import 'package:coffeelito/data/models/category/category_model.dart';
import 'package:coffeelito/data/models/product/product_model.dart';
import 'package:coffeelito/presentation/tab_box/app_routes.dart';
import 'package:coffeelito/presentation/tab_box/home/widgets/search_logic.dart';
import 'package:coffeelito/utils/colors.dart';
import 'package:coffeelito/utils/icons.dart';
import 'package:coffeelito/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController searchController = TextEditingController();

  late String categoryId;

  @override
  void initState() {
    categoryId = BlocProvider.of<ProductBloc>(context).categoryId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F9F9F9,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 260.h,
            backgroundColor: AppColors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor:
                    Color.lerp(AppColors.C_313131, AppColors.C_131313, 0.6),
                statusBarIconBrightness: Brightness.light),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [AppColors.C_131313, AppColors.C_313131],
                          ),
                        ),
                      ),
                      Container(
                        height: 70.h,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      48.ph,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: SearchLogic(controller: searchController),
                      ),
                      24.ph,
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(AppIcons.coffeePng1,
                              fit: BoxFit.cover))
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 38.h,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.white,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  bottom: 8.h,
                ),
                child: StreamBuilder<List<CategoryModel>>(
                  stream: context.read<CategoryBloc>().getCategories(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CategoryModel>> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? SizedBox(
                              height: 36.h,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ZoomTapAnimation(
                                    onTap: () {
                                      setState(() {
                                        categoryId = '';
                                        BlocProvider.of<ProductBloc>(context)
                                            .add(ChangeCateIdProductsEvent(
                                                cateId: categoryId));
                                      });
                                    },
                                    child: Container(
                                      height: 20.h,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: categoryId.isEmpty
                                            ? AppColors.C_C67C4E
                                            : AppColors.white,
                                        border: Border.all(
                                            width: 1.w,
                                            color: AppColors.C_C67C4E),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: categoryId.isEmpty
                                                ? AppColors.white
                                                : AppColors.C_2F2D2C,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ...List.generate(
                                    snapshot.data!.length,
                                    (index) => ZoomTapAnimation(
                                      onTap: () {
                                        setState(() {
                                          categoryId =
                                              snapshot.data![index].categoryId;
                                          BlocProvider.of<ProductBloc>(context)
                                              .add(ChangeCateIdProductsEvent(
                                                  cateId: categoryId));
                                        });
                                      },
                                      child: Container(
                                        height: 20.h,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          color: categoryId ==
                                                  snapshot
                                                      .data![index].categoryId
                                              ? AppColors.C_C67C4E
                                              : AppColors.white,
                                          border: Border.all(
                                              width: 1.w,
                                              color: AppColors.C_C67C4E),
                                        ),
                                        child: Center(
                                          child: Text(
                                            snapshot.data![index].categoryName,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: categoryId ==
                                                      snapshot.data![index]
                                                          .categoryId
                                                  ? AppColors.white
                                                  : AppColors.C_2F2D2C,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : const Center(
                              child: Text("Empty"),
                            );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),
          BlocConsumer<ProductBloc, ProductState>(
            builder: (context, state) {
              return StreamBuilder<List<CoffeeModel>>(
                stream: context.read<ProductBloc>().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CoffeeModel> products = [];
                    if (searchController.text.isNotEmpty) {
                      for (var element in snapshot.data!) {
                        if (element.coffeeName
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          products.add(element);
                        }
                      }
                    }
                    return products.isNotEmpty
                        ? SliverPadding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 16.h),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200.h,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 0.6.h,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  CoffeeModel coffeeModel = products[index];
                                  return ZoomTapAnimation(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteNames.detailScreen,
                                          arguments: coffeeModel);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: AppColors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 3,
                                                blurRadius: 6,
                                                color: Colors.grey,
                                                offset: Offset(6.w, 6.h))
                                          ]),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            child: CachedNetworkImage(
                                              imageUrl: coffeeModel.coffeeImage,
                                              width: double.infinity,
                                              height: 132.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          12.ph,
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 12.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  coffeeModel.coffeeName,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .C_2F2D2C,
                                                          fontSize: 14.sp),
                                                ),
                                                Text(
                                                  coffeeModel.description,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                8.ph,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      coffeeModel.coffeePrice
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          fontFamily: "Sora",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .C_2F4B4E),
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w,
                                                              vertical: 8.w),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          color: AppColors
                                                              .C_C67C4E),
                                                      child: SvgPicture.asset(
                                                        AppIcons.plus,
                                                        width: 16.w,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                childCount: products.length,
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Center(
                              child: Lottie.asset(AppIcons.empty),
                            ),
                          );
                  }
                  if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(snapshot.error.toString()),
                      ),
                    );
                  }
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              );
            },
            listener: (context, state) {
              if (state is ProductUpdateState) {
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
