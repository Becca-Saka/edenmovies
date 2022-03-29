import 'package:edenmovies/app/barrel.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedController>(builder: (context, controller, child) {
      return WillPopScope(
        onWillPop: () async {
          controller.clearSearch();
          return true;
        },
        child: Scaffold(
          backgroundColor: appColor2,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        controller.clearSearch();
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText:
                                'Search for a movie, author, genre, year...',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                          ),
                          onChanged: controller.searchMovies),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Visibility(
                  visible: controller.searchList.isNotEmpty,
                  replacement: Visibility(
                    visible: controller.searchTerm.isEmpty,
                    replacement: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Looks like we couldn\'t find anything for "${controller.searchTerm}".',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Try searching for another movie, author, genre, year...',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[500]!),
                          ),
                        ],
                      ),
                    ),
                    child: const Expanded(
                      child: Center(
                        child: Text(
                          'Search from our database of amazing movies',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  child: Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.searchList[index];
                        return InkWell(
                          onTap: () {
                            controller.navigateToSingleItem(
                                item, '${item.id}+searchList');
                          },
                          child: Hero(
                            tag: '${item.id}+searchList',
                            child: Image.network(item.posterurl),
                          ),
                        );
                      },
                      itemCount: controller.searchList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
