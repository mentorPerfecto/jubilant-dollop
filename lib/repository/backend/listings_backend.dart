import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/repository/services/api/api_service.dart';

class ListingsBackend extends ApiService {
  Future<dynamic> fetchListings({
    String? categoryId,
    int? page = 1,
    String? minPrice,
    String? maxPrice,
    String? title,
  }) async {
    return getMth(
      fetchListingsUri(
        page: page.toString(),
        categoryId: categoryId,
        minPrice: minPrice,
        maxPrice: maxPrice,
        title: title,
      ),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchSingleListing({required String id}) async {
    return getMth(
      fetchSingleListingUri(id: id),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchListingImage({required String uri}) async {
    return getMth(
      Uri.parse(uri),
      headers: apiHeaderWithToken,
    );
  }
}
