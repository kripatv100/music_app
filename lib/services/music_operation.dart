import 'package:music_app/models/music.dart';

class MusicOperation {
  MusicOperation._() {}
  static List<Music> getMusic() {
    return <Music>[
      Music(
        'Aariro',
        'https://i.ytimg.com/vi/B23VsbFij6Q/hq720.jpg',
        'Aariro Daiva thirumakal',
        'aariro.mp3',
      ),
      Music(
        'Antha nalil',
        'https://i.ytimg.com/vi/Kf5pM0XES2k/hq720.jpg',
        'Antha nalil-pattam pole',
        'antha_nalil.mp3',
      ),
      Music(
          'Onakkaka Puranthene',
          'https://i.ytimg.com/vi/zir6_5tu28k/maxresdefault.jpg',
          'onakaka panniyarum padminiyum',
          'Onakkaga Poranthaenae.mp3'),
      Music(
          'Kannathil Muthamittal',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTioyTNRbypvz1Hyi5c0CiZonVKtNskoVMj6CVDQ6Rz8eJ_vTR3',
          'Kannathil muthamittal male',
          'Kannathil Muthamittal Male Version - song.mp3')
    ];
  }
}
