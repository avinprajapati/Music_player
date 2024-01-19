import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:on_audio_room/on_audio_room.dart';

class data extends GetxController {

    RxList<SongModel> song_list=RxList();
   RxList<FavoritesEntity> fav_list=RxList();
     RxBool fav=false.obs;
    RxList<AlbumModel> alubum_list=RxList();
    RxList<ArtistModel> artist_list=RxList();
    static OnAudioQuery _audioQuery=OnAudioQuery();
    static AudioPlayer player=AudioPlayer();
    RxBool isplay=false.obs;
    RxDouble duration=0.0.obs;

    RxInt cur_ind=0.obs;

    get_song()
    async {
        song_list.value= await _audioQuery.querySongs();
        return song_list;
    }
    get_duration(){
        player.onPositionChanged.listen((Duration d){
            duration.value=d.inMilliseconds.toDouble();
        });
    }
    get_alubm()
    async {
        alubum_list.value= await _audioQuery.queryAlbums();
        return alubum_list;
    }
    get_artist()
    async {
        artist_list.value= await _audioQuery.queryArtists();
        return artist_list;
    }
    get_fav() async {
        fav_list.value=await OnAudioRoom().queryFavorites();
        return fav_list;
    }
    get_chek() async {
        fav.value=await OnAudioRoom().checkIn(RoomType.FAVORITES, song_list.value[cur_ind.value].id);
    }

}