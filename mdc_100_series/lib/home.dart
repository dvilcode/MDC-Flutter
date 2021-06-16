// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({this.category = Category.all});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category),
    );
  }

  // List<Card> _buildGridCards(BuildContext context) {
  //   List<Product> products = ProductsRepository.loadProducts(Category.all);

  //   if (products == null || products.isEmpty) {
  //     return <Card>[];
  //   }

  //   final ThemeData theme = Theme.of(context);
  //   final NumberFormat formatter = NumberFormat.simpleCurrency(
  //     locale: Localizations.localeOf(context).toString(),
  //   );

  //   return products
  //       .map(
  //         (e) => Card(
  //           elevation: 0.0,
  //           clipBehavior: Clip.antiAlias,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               AspectRatio(
  //                 aspectRatio: 18.0 / 11.0,
  //                 child: Image.asset(
  //                   e.assetName,
  //                   package: e.assetPackage,
  //                   fit: BoxFit.fitWidth,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: <Widget>[
  //                     Text(
  //                       e.name,
  //                       style: theme.textTheme.button,
  //                       maxLines: 1,
  //                       softWrap: false,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     const SizedBox(height: 8.0),
  //                     Text(
  //                       formatter.format(e.price),
  //                       style: theme.textTheme.subtitle1,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       )
  //       .toList();
  // }

}
