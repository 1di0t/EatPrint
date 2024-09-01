import 'package:eat_print/api/page_loading_api.dart';
import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../api/posting_api.dart';
import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> posts;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (checkPageLoading(context, snapshot) != Container()) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Column(
                  children: [
                    // User info widget=========================,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('유저 번호: ${post.userNum}',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                    // Image widget=============================,
                    SizedBox(
                      height: 600,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: post.imageUrls.length,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(0),
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            child: Image.network(
                              post.imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Dots bar widget=============================,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        post.imageUrls.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Content widget=============================,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(post.content,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Text('예기치 못한 에러가 발생했습니다.');
          }
        },
      ),
      bottomNavigationBar: const AppBarWidget(),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      width: _currentPage == index ? 8 : 6,
      height: _currentPage == index ? 8 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Theme.of(context).primaryColor
            : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }
}
