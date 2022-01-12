import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'di.dart';
import 'my_app.dart';
import 'presentation/features/products_list/blocs/products_list_bloc.dart';
import 'presentation/navigation/app_router.dart';

void main() async {
  await configureDependencies(environmentFilter: SimpleEnvironmentFilter(filter: (_) => true));
  final appRouter = getIt<AppRouter>();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductsListBloc>(
        create: (context) => ProductsListBloc(listProducts: getIt(), openProduct: getIt())..execute(),
      )
    ],
    child: MyApp(
      appRouter: appRouter,
    ),
  ));
}