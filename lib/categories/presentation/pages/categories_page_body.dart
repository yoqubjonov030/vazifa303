import 'package:flutter/material.dart';
import 'categories_view_model.dart';

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({super.key, required this.viewModel});

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5),
      children: [
        if (viewModel.mainCategory != null)
          Column(
            spacing: 10,
            children: [
              Text(
                viewModel.mainCategory!.title,
                style: TextStyle(color: Colors.white),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.network(
                  viewModel.mainCategory!.image,
                  fit: BoxFit.cover,
                  width: 356,
                  height: 148,
                ),
              ),
            ],
          ),
        SizedBox(height: 10,),
        GridView.builder(
          padding: EdgeInsets.only(bottom: 50),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: viewModel.categories.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    viewModel.categories[index].image,
                    width: 158,
                    height: 144,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  viewModel.categories[index].title,
                  style: TextStyle(color: Colors.white),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}