
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import '../../../controller/imageDark.dart';

class PlayAudio extends StatefulWidget {
  const PlayAudio({super.key});

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView (
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How to embrace rejection",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'NotoSans',
                fontSize: 24,
              ),
            ),
            Text(
              "by: Health and lifestyle",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: ProgressBar(
                progress: Duration(seconds: 2117),
                buffered: Duration(seconds: 2300),
                total: Duration(seconds: 3900),
                progressBarColor: Colors.orange,
                bufferedBarColor: Color.fromRGBO(255, 165, 0, 0.24),
                baseBarColor: Color.fromRGBO(255, 165, 0, 0.24),
                thumbColor: Colors.orange,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  IconButton(
                    //
                    icon: getImageDarkLight(Imagelight: 'assets/speed_icon.png',Imagedark: 'assets/speed_icon_dark.png'),

                    //icon: Image.asset('assets/speed_icon.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/m15.png',Imagedark: 'assets/m15_dark.png'),
                    //icon: Image.asset('assets/m15.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),
                  Container(
                    width: 60, // Set the desired width for the play button
                    height: 60, // Set the desired height for the play button
                    child: IconButton(
                      icon: getImageDarkLight(Imagelight: 'assets/play_button.png',Imagedark: 'assets/play_button_dark.png'),
                      //icon: Image.asset('assets/play_button.png'),
                      onPressed: () {
                        // Handle the onPressed event for the favorite button
                      },
                    ),
                  ),
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/plus15.png',Imagedark: 'assets/plus15_dark.png'),

                    //icon: Image.asset('assets/plus15.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/sleep_icon.png',Imagedark: 'assets/sleep_icon_dark.png'),

                    //icon: Image.asset('assets/sleep_icon.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/download.png',Imagedark: 'assets/download_dark.png'),

                    //icon: Image.asset('assets/download.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/options_icon.png',Imagedark: 'assets/options_icon_dark.png'),

                    //icon: Image.asset('assets/options_icon.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),
                  IconButton(
                    icon: getImageDarkLight(Imagelight: 'assets/share.png',Imagedark: 'assets/share_dark.png'),

                    //icon: Image.asset('assets/share.png'),
                    onPressed: () {
                      // Handle the onPressed event for the favorite button
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



