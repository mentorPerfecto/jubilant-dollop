import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/src/components.dart';
import 'package:ecommerce/src/config.dart';
import 'package:ecommerce/src/providers.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    // ref.watch(marketPlaceViewModel).initMarketPlace();
    var  profileProvider = ref.watch(profileViewModel);


    // Future.microtask((){
    //   profileProvider.loadData(context).then((value) => ref
    //       .watch(walletViewModel)
    //       .getAcctBalance(userType: profileProvider.profileData?.role ?? 0));
    // });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = 360.w;
    ref.watch(themeViewModel).themeMode;
    var profileProvider = ref.watch(profileViewModel);
    var dashProvider = ref.watch(dashboardViewModel);
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: AppColors.kWhite,
      body: XResponsiveWrap.mobile(
        onRefresh: () async {
          // await  profileProvider.loadData(context).whenComplete((){
          //   walletProvider
          //       .getAcctBalance(userType: profileProvider.profileData?.role!)
          //       .then((value) => marketPlaceProvider.initMarketPlace());
          // });

        },
        //loading: marketPlaceProvider.isGettingPropertiesListings,
      //  loadFailed: marketPlaceProvider.propertiesListings == [],
        children: [
          Gap(10.h),

          // int.parse(profileProvider.profileData!.role.toString()) > 1
          //     ?
          // profileProvider.kycResponseStatus?.data == null
          //     ? AccountVerification(screenWidth: screenWidth)
          //     : Container(),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextView(
                text: newestListing,
                fontSize: 18.spMin,
                fontFamily: ttHoves,
                fontWeight: FontWeight.w600,
                //color: AppColors.kTextBlack,
              ),
              TextView(
                onTap: () {
                  dashProvider.setBottomBarItem(context, 1);
                },
                text: viewAll,
                fontSize: 13.spMin,
                fontFamily: ttHoves,
                fontWeight: FontWeight.w400,
                //color: AppColors.kTextBlack,
              ),
            ],
          ),
          // SizedBox(
          //   height: 10.h,
          // ),
          // marketPlaceProvider.isGettingPropertiesListings
          // ?
          //      CustomShimmerLoader(
          //   containerHeight: 150.h,
          //   height: 450.h,
          //   itemCount: 6,
          // )
          //     : marketPlaceProvider.propertiesListings.isEmpty
          //         ? EmptyListStateWidget(
          //             height: 450.h,
          //             stateDesc:
          //                 "Stay tuned! \nNew listings for rent will be added soon.")
          //         : SizedBox(
          //             height: double.parse((280.h *
          //                     marketPlaceProvider.propertiesListings.length)
          //                 .toString()),
          //             child: ListView.builder(
          //               physics: const NeverScrollableScrollPhysics(),
          //               itemCount:
          //                   marketPlaceProvider.propertiesListings.length,
          //               itemBuilder: (context, index) {
          //                 var item =
          //                     marketPlaceProvider.propertiesListings[index];
          //                 return ListingsGridItem(
          //                   isAPropertyListing: false,
          //                   propertyType:item.propertyType.toString(),
          //                   role: int.parse(
          //                       profileProvider.profileData?.role.toString() ??
          //                           '1'),
          //                   listingId: item.listingId.toString(),
          //                   listingType: item.listingType.toString(),
          //                   userId: item.userId.toString(),
          //                   isVerified: item.isVerified,
          //                   isAvailable:
          //                       int.parse(item.availableUnits!.toString()) > 0,
          //                   bedNumber: item.bedrooms.toString(),
          //                   bathNumber: item.bathrooms.toString(),
          //                   imageText: item.images!.first.toString(),
          //                   price: item.price.toString(),
          //                   nameOfHouse: item.title.toString(),
          //                   houseAddress: item.address.toString(),
          //                 );
          //               },
          //             ),
          //           ),
        ],
      ),
    );
  }
}