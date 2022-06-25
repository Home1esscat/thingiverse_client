import 'dart:developer';

import 'package:explore_nav_bar/constants/global_colors.dart';
import 'package:explore_nav_bar/network/api/random_thing_api.dart';
import 'package:explore_nav_bar/network/models/images_list_model.dart';
import 'package:explore_nav_bar/network/models/single_thing_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.currentThing}) : super(key: key);
  final int currentThing;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<SingleThing> thing;

  @override
  Widget build(BuildContext context) {
    thing = RandomThingApi().getSingleThing(widget.currentThing);
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return FutureBuilder<SingleThing>(
      future: thing,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: _ImageList(
                      imageId: snapshot.data!.id.toString(),
                    ),
                  ),
                  _CreatorTile(
                    isliked: snapshot.data!.isLiked!,
                    likeCount: snapshot.data!.likeCount.toString(),
                    creatorName: snapshot.data!.creator!.name!,
                    avatar: snapshot.data!.creator!.thumbnail!,
                    shortDescription: snapshot.data!.name!,
                  ),
                  _GeneralInfo(
                    longDescription: snapshot.data!.descriptionHtml.toString(),
                  ),
                  _BottomGrid(),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class _CreatorTile extends StatefulWidget {
  const _CreatorTile(
      {required this.isliked,
      required this.likeCount,
      required this.creatorName,
      required this.avatar,
      required this.shortDescription});
  final bool isliked;
  final String creatorName;
  final String avatar;
  final String likeCount;
  final String shortDescription;

  @override
  State<_CreatorTile> createState() => _CreatorTileState();
}

class _CreatorTileState extends State<_CreatorTile> {
  @override
  Widget build(BuildContext context) {
    bool _open = widget.isliked;
    log("состояние" + _open.toString());

    return Container(
      padding: const EdgeInsets.all(8),
      color: GlobalColors.gridGreyColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(widget.avatar),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.creatorName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: GlobalColors.globalColor),
                ),
                Text(
                  widget.shortDescription,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: widget.isliked
                    ? const Icon(Icons.favorite_rounded)
                    : const Icon(Icons.favorite_outline_rounded),
                onPressed: () => {},
                iconSize: 32,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  widget.likeCount,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ImageList extends StatelessWidget {
  _ImageList({Key? key, required this.imageId}) : super(key: key);
  final String imageId;
  late Future<List<ImagesListModel>> listImages;

  @override
  Widget build(BuildContext context) {
    listImages = RandomThingApi().getImageList(imageId);
    final double _screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: listImages,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data as List<ImagesListModel>;
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(width: 4);
            },
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InteractiveViewer(
                child: Image.network(
                  data[index].sizes[12].url.toString(),
                  width: _screenWidth,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _GeneralInfo extends StatelessWidget {
  const _GeneralInfo({required this.longDescription});
  final String longDescription;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: longDescription,
    );
  }
}

class _BottomGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        _gridElement(context, 1, 'Files', 'assets/images/ic_files.png'),
        _gridElement(context, 2, 'Comments', 'assets/images/ic_comments.png'),
        _gridElement(context, 3, 'Makes', 'assets/images/ic_makes.png'),
        _gridElement(context, 4, 'Remix', 'assets/images/ic_remix.png'),
      ],
    );
  }

  Widget _gridElement(
      BuildContext context, int page, String description, String asset) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () => _openNewPage(context, page),
      child: Container(
        margin: const EdgeInsets.all(4),
        color: GlobalColors.gridGreyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, height: 64),
            const SizedBox(height: 2),
            Text(
              description,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _openNewPage(BuildContext context, int page) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text("Not Implemented Yet"),
    ));
  }
}
