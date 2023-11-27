import 'package:flutter/material.dart';

import '../../../controller/imageDark.dart';

class InfoAudio extends StatefulWidget {
  const InfoAudio({super.key});

  @override
  State<InfoAudio> createState() => _InfoAudioState();
}

class _InfoAudioState extends State<InfoAudio> {

  String getImagePath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    // Conditionally select the image based on the theme
    if (brightness == Brightness.light) {
      return 'assets/bg_player_light.png';
    } else {
      return 'assets/bg_player_dark.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: double.infinity,
            child:getImageDarkLight(Imagelight: 'assets/bg_player_light.png',Imagedark: 'assets/bg_player_dark.png')
              ,
            // child: Image.asset(
            //   getImagePath(context),
            //   fit: BoxFit
            //       .fill, // Make the image stretch to fill its container
            // ),

          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.07,
          ),
          child: Center(
            child: Image.asset(
              'assets/image_live_better.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width *
                  1, // Adjust the size as needed
              height: MediaQuery.of(context).size.height *
                  1, // Adjust the size as needed
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.width *
              0.25, // Adjust the position as needed
          left: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.8,
            child: Text(
              "Live better".toUpperCase(),
              maxLines: 3, // Set the maximum number of lines
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  // Change text color as needed
                  fontSize: 54,
                  fontFamily: 'Rubik',
                  height: 1.2222,
                  fontWeight:
                  FontWeight.w900 // Adjust text size as needed
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width *
              0.12, // Adjust the position as needed
          right: MediaQuery.of(context).size.width *
              0.12, // Adjust the position as needed
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: IconButton(
              icon: Image.asset('assets/like.png'),
              onPressed: () {
                // Handle the onPressed event for the favorite button
              },
            ),
          ),
        ),
      ],
    );
  }
}
