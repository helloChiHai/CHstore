import 'package:chstore/blocs/ProductBloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chstore/blocs/ProductBloc/product_bloc.dart';
import 'package:chstore/blocs/ProductBloc/product_state.dart';

class ShowProductPage extends StatefulWidget {
  @override
  State<ShowProductPage> createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(GetProduct());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitialState) {
            print('bat dau khoi tao');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoadingState) {
            print('dang load san pham ....');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccessState) {
            print('hien thi thanh cong');
            final products = state.product;
            return Container(
              width: size.width,
              height: size.height,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product.nameProduct),
                    subtitle: Text(product.priceProduct.toString()),
                  );
                },
              ),
            );
          } else if (state is ProductFailureState) {
            print(state.error);
            return Center(
              child: Text('Failed to load products: ${state.error}'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
