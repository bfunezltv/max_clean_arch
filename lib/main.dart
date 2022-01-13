import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/presentation/common/min_exec_time_task.dart';
import 'package:max_clean_arch/presentation/const.dart';
import 'package:max_clean_arch/presentation/generated/assets.gen.dart';

import 'di.dart';
import 'my_app.dart';
import 'presentation/features/products_list/blocs/products_list_bloc.dart';
import 'presentation/features/splash/widgets/splash_page.dart';
import 'presentation/navigation/app_router.dart';
import 'state/app_state_manager.dart';


void main() async {
  final initializingTask = MinExecTimeTask<GetIt>(
      minDelay: kSplashTimeout,
      compute: () {
        return configureDependencies(environmentFilter: SimpleEnvironmentFilter(filter: (_) => true));
      });
  late final appRouter = getIt<AppRouter>();
  //
  runApp(
    FutureBuilder<String>(
      future: initializingTask.start().then((_) {
        getIt<AppStateManager>().setInitialized(true);
        return 'ok';
      }),
      builder: (context, future) {
        if (!future.hasData) {
          return MaterialApp(
            home: SplashPage(
              splashImage: Assets.splash.shoppingSplash,
            ),
          );
        }
        //
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductsListBloc>(
              create: (context) => ProductsListBloc(listProducts: getIt(), openProduct: getIt())..execute(),
            )
          ],
          child: MyApp(
            appRouter: appRouter,
          ),
        );
      },
    ),
  );
}
