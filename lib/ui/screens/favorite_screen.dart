import 'package:explore_nav_bar/constants/global_colors.dart';
import 'package:explore_nav_bar/network/api/favorite_things_catalog_api.dart';
import 'package:explore_nav_bar/network/models/favorite_things_list_model.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late Future<List<FavoriteThingsCatalog>> things;
  @override
  Widget build(BuildContext context) {
    things = FavoriteThingsCatalogApi().getfavoriteThings();

    return FutureBuilder(
      future: things,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var data = snapshot.data as List<FavoriteThingsCatalog>;
          return RefreshIndicator(
            onRefresh: () async {
              updateList();
            },
            child: ListView(
              children: [
                Container(
                  color: GlobalColors.gridGreyColor,
                  height: 24,
                  child: const Center(
                      child: Text(
                    'Swipe to update favorite list',
                    style: TextStyle(color: GlobalColors.localColor),
                  )),
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return _fullCard(data, index);
                    //title: Text(data[index].name!),
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _fullCard(List<FavoriteThingsCatalog> data, int index) {
    return SizedBox(
      height: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(8),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(data[index].thumbnail!),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              _titleAvatar(
                  data[index].creator!.thumbnail.toString(), data[index].name!),
              Positioned(
                right: 12,
                bottom: 12,
                child: FloatingActionButton(
                  heroTag: index,
                  child: const Icon(Icons.share),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleAvatar(String avatar, String description) {
    return Container(
      color: GlobalColors.gridGreyColor,
      child: ListTile(
        leading: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(avatar),
        ),
        title: Text(description),
      ),
    );
  }

  void updateList() {
    setState(() {
      things = FavoriteThingsCatalogApi().getfavoriteThings();
    });
  }
}
