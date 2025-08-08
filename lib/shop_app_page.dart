import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/product_bloc.dart';

class ShopAppPage extends StatelessWidget {
  const ShopAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop App Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (ctx, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductLoaded) {
            final products = state.products;
            return GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (ctx, index) {
                final product = products[index];
                return GridTile(
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(product.title, textAlign: TextAlign.center),
                    subtitle: Text(product.price.toString()),
                  ),
                );
              },
            );
            // return ListView.builder(
            //   itemCount: state.products.length,
            //   itemBuilder: (ctx, index) {
            //     return ListTile(
            //       title: Text(state.products[index].name),
            //       subtitle: Text(state.products[index].price.toString()),
            //     );
            //   },
            // );
          }
          return Container();
        },
      ),
    );
  }
}
