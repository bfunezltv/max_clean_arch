import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:max_clean_arch/generated/l10n.dart';
import 'package:max_clean_arch/presentation/common/simple_bloc/simple_bloc.dart';
import 'package:max_clean_arch/presentation/extensions/duration_x.dart';
import 'package:max_clean_arch/presentation/features/products_list/blocs/products_list_bloc.dart';

import 'products_list_widget.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).productsList),
      ),
      body: BlocConsumer<ProductsListBloc, SimpleBlocState<KtList<Product>>>(
        listener: (context, state) {
          final bloc = context.read<ProductsListBloc>();
          if (state.hasError && bloc.hasData) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                bloc.error!.error.toString(),
                textAlign: TextAlign.center,
              ),
            ));
            bloc.resetError();
          }
        },
        builder: (context, state) {
          final bloc = context.read<ProductsListBloc>();
// print('products list tbloc [${bloc.hashCode}], (${state.hasData}/${bloc.hasData}, ${bloc.hasError}/${state.hasError}),'
//     'state: $state, data: ${bloc.data}, error: ${bloc.error}');
          if (bloc.hasData) {
            return RefreshIndicator(
              onRefresh: () {
                bloc.execute();
                return bloc.stream.firstWhere((state) => !state.inProgress);
              },
              child: AnimatedSwitcher(
                duration: 500.ms,
                reverseDuration: 0.ms,
                // Define custom layout builder to fully expand products widgets vertically.
                // It's actual for small amount of data like just 2 or 3 products that consume a half of screen.
                layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
                  return Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      ...previousChildren,
                      if (currentChild != null) currentChild,
                    ],
                  );
                },
                child: ProductsListWidget(
                  // With this key AnimatedSwitcher applies effect on every success products retrieval
                  key: ValueKey(identityHashCode(bloc.data!)),
                  products: bloc.data!,
                  onProductClick: bloc.openProduct,
                ),
              ),
            );
          }
          if (state.inProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (bloc.hasError)
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    bloc.error!.error.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              Center(
                child: ElevatedButton(
                  child: Text(S.of(context).loadProducts),
                  onPressed: bloc.execute,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
