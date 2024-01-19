import 'package:dio/dio.dart';
import 'package:e_commerce/model_class.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/floating_widget/gf_floating_widget.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

class product_detail extends StatefulWidget {
  const product_detail({super.key});

  @override
  State<product_detail> createState() => _product_detailState();
}

class _product_detailState extends State<product_detail> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    Model model = ModalRoute.of(context)!.settings.arguments as Model;
    List images = model.images!;
    print(model.rating);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${model.title}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GFCarousel(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                items: images.map(
                  (url) {
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(url,
                            fit: BoxFit.fitHeight, width: 1000.0),
                      ),
                    );
                  },
                ).toList(),
                onPageChanged: (index) {
                  setState(() {
                    index;
                  });
                },
              ),
              // Container(
              //   height: 100,
              //   child: ListView.builder(
              //     itemCount: images.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {
              //           image_name = images[index];
              //           setState(() {});
              //         },
              //         child: Container(
              //           margin: EdgeInsets.all(5),
              //           width: 75,
              //           decoration: BoxDecoration(
              //             border: Border.all(),
              //             borderRadius: BorderRadius.circular(10),
              //             image: DecorationImage(
              //               fit: BoxFit.fill,
              //               image: NetworkImage('${images[index]}'),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Center(
                child: Text(
                  "${model.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              Center(
                child: Text(
                  "Price : ${model.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              GFRating(
                inputDecorations: InputDecoration(hintText: "Hello"),
                color: Colors.green,
                borderColor: Colors.green,
                value: model.rating,
                onChanged: (value) {
                  setState(() {
                    model.rating = value;
                  });
                },
              ),
              Card(
                color: Colors.grey.shade50,
                elevation: 10,
                child: ExpansionTile(
                  title: Center(
                    child: Text(
                      "About",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  children: [
                    Text(
                      "Brand : ${model.brand}",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Category : ${model.category}",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Description : ${model.description}",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Dis(%) : ${model.discountPercentage}",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Stock : ${model.stock}",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
