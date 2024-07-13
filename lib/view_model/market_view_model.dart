import 'dart:convert';

import 'package:ecommerce/config/app_strings.dart';
import 'package:ecommerce/model/response/product_list_response.dart';
import 'package:ecommerce/src/models.dart';
import 'package:ecommerce/src/repository.dart';
import 'package:ecommerce/src/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marketPlaceViewModel =
    ChangeNotifierProvider((ref) => MarketPlaceViewModel());

class MarketPlaceViewModel extends ChangeNotifier {
  final listingService = ListingsBackend();

  bool _canLoadMoreSearchProperties = true;
  bool _isLoadingSearch = true;
  bool _isGettingSearchPage = true;
  int _searchPage = 2;

  // String? selectedListingType;
  // static ListingTypeResponse? _listingTypeResponse;
  // ListingTypeResponse? get listingTypeResponse => _listingTypeResponse;
  //
  //
  ProductListResponse? _searchPropertiesResponse ;
  List<ProductListResponse> _searchProperties = [];
  final TextEditingController _minAmountController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _maxAmountController = TextEditingController();
  TextEditingController get minAmountController => _minAmountController;
  TextEditingController get maxAmountController => _maxAmountController;
  TextEditingController get searchController => _searchController;
  bool get isLoadingSearch => _isLoadingSearch;
  bool get canLoadMoreSearchProperties => _canLoadMoreSearchProperties;
  bool get isGettingSearchPage => _isGettingSearchPage;
  int get searchPage => _searchPage;
  List<ProductListResponse> get searchProperties => _searchProperties;



  Future<void> initMarketPlace() async {
    await getSearchProperties();

  }

  Future<void> resetPageKey() async {
    _searchPage = 2;
    notifyListeners();
  }

  void _setCanLoadMoreSearchProperties({required bool status}) {
    _canLoadMoreSearchProperties = status;
    notifyListeners();
  }


  ///ResetFilter
  void resetFilters(BuildContext context) {
    _isLoadingSearch = true;
    notifyListeners();
    _minAmountController.clear();
    _maxAmountController.clear();
    _searchController.clear();
  //  selectedListingType = null;
    Future.sync(() => getSearchProperties());
    _searchPage = 2;
    notifyListeners();
    Navigator.of(context).pop();
  }

  Future<void> applyFilters() async {
    _isLoadingSearch = true;
    _searchPage = 2;
    notifyListeners();
    Future.sync(() => getSearchProperties());
  }

  ///Method to get all in a location properties from api
  Future<void> getSearchProperties() async {
    _canLoadMoreSearchProperties = true;
    try {
      await listingService
          .fetchListings(
        maxPrice: _maxAmountController.text.toString(),
        minPrice: _minAmountController.text.toString(),
        title: _minAmountController.text.toString(),
      )
          .then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());
          _searchProperties = (decodedResponse as List) .map((e) => ProductListResponse.fromJson(e)).toList();
          notifyListeners();
          // check page count if its more than one, on every successful data fetch
          logger. f(int.parse(_searchProperties.length.toString()) > 10);
          _setCanLoadMoreSearchProperties(
              status: int.parse(_searchProperties!.length.toString()) > 10);
        }
      }).whenComplete(() {
        _isLoadingSearch = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  Future<dynamic> getMoreSearchProperties() async {
    /// change the state of list pagination loader
    _isGettingSearchPage = true;
    notifyListeners();
    logger.f("Call Page $_searchPage");
    await listingService
        .fetchListings(
      page: _searchPage,
      // searchVal: _searchController.text.toLowerCase(),
    )
        .then((value) {
      if (value != null) {
        final decodedResponse = jsonDecode(value.toString());
        //
        // if (decodedResponse['status'].toString() == 'true') {
        //   _searchPropertiesResponse = ListingsResponseModel.fromJson(decodedResponse);
        //   _searchProperties
        //       .addAll(_searchPropertiesResponse!.data!.listings!.toList());
        //   notifyListeners();
        // }
        // // check page count if its more than one, on every successful data fetch
        // // update page count on every successful data fetch
        // if (int.parse(_searchPropertiesResponse!.data!.lastPage.toString()) > _searchPage *10 ) {
        //   _searchPage++;
        //   _setCanLoadMoreSearchProperties(status: true);
        // } else {
        //   _setCanLoadMoreSearchProperties(status: false);
        // }
        notifyListeners();
      }
    }).whenComplete(() {
      _isGettingSearchPage = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      logger
        ..e(error)
        ..e(stackTrace);
    });
  }





}
