// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:news_flasher/model/article_model.dart';
// import 'package:news_flasher/model/category_model.dart';
// import 'package:news_flasher/model/slider_model.dart';
// import 'package:news_flasher/pages/all_news.dart';
// import 'package:news_flasher/pages/article_view.dart';
// import 'package:news_flasher/pages/category_news.dart';
// import 'package:news_flasher/services/data.dart';
// import 'package:news_flasher/services/news.dart';
// import 'package:news_flasher/services/slider_data.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List<CategoryModel> categories = [];
//   List<sliderModel> sliders = [];
//   List<ArticleModel> articles = [];
//   bool _loading = true;
//
//   int activeIndex = 0;
//
//   @override
//   void initState() {
//     categories = getCategories();
//     getSlider();
//     getNews();
//     super.initState();
//   }
//
//   getNews() async {
//     News newsclass = News();
//     await newsclass.getNews();
//     articles = newsclass.news;
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   getSlider() async {
//     Sliders slider = Sliders();
//     await slider.getSlider();
//     sliders = slider.sliders;
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("News"),
//             Text(
//               "Flasher",
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(left: 10.0),
//                 height: 70,
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       return CategoryTile(
//                         image: categories[index].image,
//                         categoryName: categories[index].categoryName,
//                       );
//                     }),
//               ),
//               const SizedBox(
//                 height: 30.0,
//               ),
//                Padding(
//                 padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Breaking News!",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Breaking")));
//                       },
//                       child: Text(
//                         "View all",
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               CarouselSlider.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index, realIndex) {
//                   String? res = sliders[index].urlToImage;
//                   String? res1 = sliders[index].title;
//                   return buildImage(context, res!, index, res1!);
//                 },
//                 options: CarouselOptions(
//                     height: 250,
//                     viewportFraction: 1,
//                     autoPlay: true,
//                     enlargeCenterPage: false,
//                     enlargeStrategy: CenterPageEnlargeStrategy.height,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         activeIndex = index;
//                       });
//                     }),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(child: buildIndicator()),
//               const SizedBox(
//                 height: 30.0,
//               ),
//                Padding(
//                 padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Trending News!",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18),
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Trending")));
//                       },
//                       child: Text(
//                         "View all",
//                         style: TextStyle(
//                             color: Colors.blue,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Container(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: ClampingScrollPhysics(),
//                     itemCount: articles.length,
//                     itemBuilder: (context, index) {
//                       return BlogTile(
//                           url: articles[index].url!,
//                           desc: articles[index].description!,
//                           imageUrl: articles[index].urlToImage!,
//                           title: articles[index].title!);
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildImage(
//           BuildContext context, String image, int index, String name) =>
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 10.0),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: CachedNetworkImage(
//                 height: 250,
//                 fit: BoxFit.cover,
//                 width: MediaQuery.of(context).size.width,
//                 imageUrl: image,
//               ),
//             ),
//             Container(
//               height: 250,
//               padding: EdgeInsets.only(left: 10.0),
//               margin: EdgeInsets.only(top: 170.0),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black26,
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10))),
//               child: Text(
//                 name,
//                 maxLines: 2,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold),
//               ),
//             )
//           ],
//         ),
//       );
//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         activeIndex: activeIndex,
//         count: 5,
//         effect: SlideEffect(
//             dotWidth: 10, dotHeight: 10, activeDotColor: Colors.blue),
//       );
// }
//
// class CategoryTile extends StatelessWidget {
//   final image, categoryName;
//
//   CategoryTile({this.categoryName, this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(name: categoryName)));
//       },
//       child: Container(
//         margin: EdgeInsets.only(right: 16),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: Image.asset(
//                 image,
//                 width: 120,
//                 height: 70,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: 120,
//               height: 70,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 color: Colors.black38,
//               ),
//               child: Center(
//                 child: Text(
//                   categoryName,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BlogTile extends StatelessWidget {
//   String imageUrl, title, desc, url;
//   BlogTile(
//       {required this.desc,
//       required this.imageUrl,
//       required this.title,
//       required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 10.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: Material(
//             elevation: 3.0,
//             borderRadius: BorderRadius.circular(10),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: CachedNetworkImage(
//                         imageUrl: imageUrl,
//                         height: 120,
//                         width: 120,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           maxLines: 2,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 17.0,
//                           ),
//                         ),
//                         SizedBox(height: 7.0),
//                         Text(
//                           desc,
//                           maxLines: 3,
//                           style: TextStyle(
//                             color: Colors.black54,
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//


import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_flasher/model/category_model.dart';
import 'package:news_flasher/model/slider_model.dart';
import 'package:shimmer/shimmer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../model/article_model.dart';
import '../services/data.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
import 'all_news.dart';
import 'article_view.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true, loading2=true;

  int activeIndex = 0;
  @override
  void initState() {
    categories = getCategories();
    getSlider();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSlider() async {
    Sliders slider= Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {
      loading2=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News"),
            Text(
              "Flasher",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Breaking")));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              loading2? Center(child: CircularProgressIndicator()):  CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].urlToImage;
                    String? res1 = sliders[index].title;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      })),
              SizedBox(
                height: 30.0,
              ),
              Center(child: buildIndicator()),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending News!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllNews(news: "Trending")));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          url:  articles[index].url!,
                          desc: articles[index].description!,
                          imageUrl: articles[index].urlToImage!,
                          title: articles[index].title!);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(

            height: 250,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, imageUrl: image,
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10.0),
          margin: EdgeInsets.only(top: 170.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
            child: Text(
              name,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]));

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 5,
    effect: SlideEffect(
        dotWidth: 10, dotHeight: 10, activeDotColor: Colors.blue),
  );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;
  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,

              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Center(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  BlogTile({
    required this.desc,
    required this.imageUrl,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => ShimmerWidget(), // Use ShimmerWidget as placeholder
                          errorWidget: (context, url, error) => Container( // Error widget when image loading fails
                            height: 120,
                            width: 120,
                            color: Colors.grey, // Placeholder color
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              desc,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Define ShimmerWidget here
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 6,
                    width: double.infinity / 2,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}