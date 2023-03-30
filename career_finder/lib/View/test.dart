import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  initState() {
    getAllImages();
  }

  getAllImages() async {
    //The 5 universities list
    List<String> universitiesList = [
      "Harvard University",
      "Stanford University",
      "University of California Berkeley",
      "University of Oxford",
      "University of Washington Seattle",
    ];
    for (int i = 0; i < 5; i++) {
      // print(universitiesList[i]);
      await getImage(universitiesList[i]);
    }
    setState(() {
      loaded = true;
    });
  }

  bool loaded = false;

  List<String> imageUrls = [];

  getImage(String searchTerm) async {
    loaded = false;
    String newSearchTerm = searchTerm.replaceAll(" ", "+");
    ;
    final String apiUrl =
        'https://pixabay.com/api/?key=34849918-d0edd4673adcfa3b93bbea0b1&q=$newSearchTerm&image_type=photo&pretty=true';

    // make the HTTP GET request
    final response = await http.get(Uri.parse(apiUrl));

    // decode the response JSON data
    final jsonData = jsonDecode(response.body);

    // print the response data
    // print(jsonData["hits"][0]);

    for (var hit in jsonData['hits'].take(1)) {
      imageUrls.add(hit['webformatURL']);
    }
    // print(imageUrls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loaded == true
            ? ListView.builder(
                itemCount: imageUrls.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: loaded == true
                                ? Image.network(
                                    imageUrls[index],
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    'images/default_university_image.jpg',
                                    alignment: Alignment.centerLeft,
                                  ),
                          ),
                        ),
                      ));
                })
            : Container(
                child: Center(child: CircularProgressIndicator()),
              ));
  }
}
// SvgPicture.network(
//             'https://www.usnews.com/static-atlas/assets/img/news/best-countries/flags-svg/USA.svg',
//           )