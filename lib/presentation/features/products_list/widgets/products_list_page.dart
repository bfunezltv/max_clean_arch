
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/presentation/features/products_list/blocs/products_list_bloc.dart';
import 'package:max_clean_arch/presentation/generated/l10n.dart';
import 'package:max_clean_arch/presentation/widgets/expanded_animated_switcher_child_layout.dart';
import 'package:single_bloc/single_bloc.dart';

import 'products_list_widget.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductsListBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).productsList),
      ),
      body: BlocConsumer<ProductsListBloc, SingleBlocState<KtList<Product>>>(
        listener: (context, state) {
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
          print('products list bloc [${bloc.hashCode}], (${state.hasData}/${bloc.hasData},'
              ' ${bloc.hasError}/${state.hasError}), state: $state, data: ${bloc.data}, error: ${bloc.error}');
          if (!bloc.hasData && !state.isCompleted) {
            return const Center(child: CircularProgressIndicator());
          }
          if (bloc.hasData || state.inProgress) {
            return AnimatedSwitcher(
              duration: 0.ms,
              reverseDuration: 1500.ms,
              child: state.inProgress
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: () {
                        bloc.execute();
                        return bloc.stream.firstWhere((state) => !state.inProgress);
                      },
                      child: AnimatedSwitcher(
                        duration: 500.ms,
                        reverseDuration: 0.ms,
                        layoutBuilder: (currentChild, previousChildren) =>
                            ExpandedAnimatedSwitcherChildLayout(currentChild, previousChildren),
                        child: ProductsListWidget(
                          // With this key AnimatedSwitcher applies effect on every success products retrieval
                          key: ValueKey(identityHashCode(bloc.data!)),
                          products: bloc.data!,
                          onProductClick: bloc.openProduct,
                        ),
                      ),
                    ),
            );
          }
          // it's an error state
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
