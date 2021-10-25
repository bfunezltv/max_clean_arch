import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:transparent_image/transparent_image.dart';

const _imageSize = 60.0;

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Hero(
                tag: product.id,
                child: SizedBox(
                  width: _imageSize,
                  height: _imageSize,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                          size: _imageSize * 0.35,
                        ),
                      ),
                      // FadeInImage.assetNetwork(placeholder: kProductPlaceholderImageAsset,
                      Center(
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Image.network(product.image, width: 60, height: 60, fit: BoxFit.contain,),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            product.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
