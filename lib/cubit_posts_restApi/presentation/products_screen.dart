import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_practice/cubit_posts_restApi/model/products_model.dart';

import '../bloc/product_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductBloc>().add(GetAllProducts());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            return Container(
                height: 100,
                child: _storyView(context, state.productsModelList));
          }
          return Container();
        },
      ),
    );
  }
}
Widget _storyView(BuildContext context, List<ProductsModel> productsModel) {
  return ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: productsModel.length,
  itemBuilder: (context, index) {
    ProductsModel productsModel = ProductsModel();
    return CircleAvatar(
      // backgroundImage: NetworkImage(productsModel.images![1]),
      child: Text(productsModel.title.toString()),
    );
  });
}