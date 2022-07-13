import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_bloc/feature/story/widget/story_data.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final List<String> textList = ['P', 'S', 'F', 'M', 'A', 'M', 'N'];
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Story Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Story',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue.shade600,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: StoryData.storyData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FullScreen(
                                  index: index,
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          child: Text(
                            textList[index],
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            // SizedBox(
            //   height: 300,
            //   child: StoryView(
            //     storyItems: [
            //       StoryItem.text(
            //         title:
            //             "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
            //         backgroundColor: Colors.orange,
            //         roundedTop: true,
            //       ),
            //       StoryItem.inlineImage(
            //         url:
            //             "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            //         controller: controller,
            //         caption: const Text(
            //           "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
            //           style: TextStyle(
            //             color: Colors.white,
            //             backgroundColor: Colors.black54,
            //             fontSize: 17,
            //           ),
            //         ),
            //       ),
            //     ],
            //     controller: controller,
            //   ),
            // ),
            // Material(
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const FullScreen(index: ,)));
            //     },
            //     child: Container(
            //       decoration: const BoxDecoration(
            //         color: Colors.black54,
            //         borderRadius:
            //             BorderRadius.vertical(bottom: Radius.circular(8)),
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: const <Widget>[
            //           Icon(
            //             Icons.arrow_forward,
            //             color: Colors.white,
            //           ),
            //           SizedBox(
            //             width: 16,
            //           ),
            //           Text(
            //             "View more stories",
            //             style: TextStyle(fontSize: 16, color: Colors.white),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class FullScreen extends StatefulWidget {
  final int index;

  const FullScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  final storyController = StoryController();
  int storyIndex = 0;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      print(DateTime.now());
      setState(() {
        ///particular user er total koy ta story ase sheta
        final usersTotalStory =
            StoryData.storyData[widget.index]["story"].length;
        print('userTotalStory:${usersTotalStory}');
        print('storyIndex:${storyIndex}');

        ///
        if (storyIndex < usersTotalStory - 1) {
          //Navigator.of(context).pop();

          storyIndex++;
        } else {
          Navigator.of(context).pop();
          //storyIndex++;
        }
        //storyIndex++;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child:
          Image.network(StoryData.storyData[widget.index]["story"][storyIndex]),
    )
        // StoryView(
        //   progressPosition: ProgressPosition.top,
        //   repeat: false,
        //   storyItems: [
        //     StoryItem.text(
        //       title: "I guess you'd love to see more of our food. That's great.",
        //       backgroundColor: Colors.blue,
        //     ),
        //     StoryItem.text(
        //       title: "Nice!\n\nTap to continue.",
        //       backgroundColor: Colors.red,
        //       textStyle: const TextStyle(
        //         fontFamily: 'Dancing',
        //         fontSize: 40,
        //       ),
        //     ),
        //   ],
        //   controller: storyController,
        // ),
        );
  }
}
