import 'package:fabcurate/provider/categoryprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void afterBuildFunction(BuildContext context) async {
    var categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.categoryScreenData(context);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => afterBuildFunction(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Category",
          style: TextStyle(color: Colors.grey),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.grey,
          ),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Icon(Icons.shopping_bag_outlined, color: Colors.grey),
              SizedBox(width: 10)
            ],
          )
        ],
      ),
      body: Consumer<CategoryProvider>(builder: (context, categoryData, child) {
        return SafeArea(
          child: Container(
            child: ListView.builder(
                itemCount: categoryData.categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.indigo[300],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Text(
                            categoryData.categories[index].categoryName,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                categoryData.categories[index].child.length,
                            itemBuilder: (context, i) {
                              return Container(
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  categoryData
                                      .categories[index].child[i].categoryName,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.indigo),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                }),
          ),
        );
      }),
    );
  }
}
