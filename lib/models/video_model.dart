class Video {
  final String name;
  final String url;
  final String thumb_url;

  const Video({required this.name, required this.url, required this.thumb_url});
}

const videos = [
  Video(
      name: "Sintel",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
      thumb_url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/images/Sintel.jpg"),
  Video(
      name: "Tears Of Steel",
      url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4", //"https://www.youtube.com/watch?v=SwkrFpydgmo",
      thumb_url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"),
  Video(
      name: "Big Buck Bunny",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      thumb_url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"),
  Video(
      name: "Elephant Dream",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      thumb_url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg"),
  Video(
      name: "For Bigger Blazes",
      url:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      thumb_url:
          "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg"),
];




// class VideoModel{
//   late String title,link,thumb_url;
//   VideoModel({required this.title, required this.link, required this.thumb_url
// });
// VideoModel.fromJson(Map<String,dynamic>json){
//   title = json['title'] ;
//   link = json['link'] ;
//   thumb_url= json['thumb_url'] ;
// }
// Map<String, dynamic>toJson(){
//   final Map<String,dynamic>data = Map<String,dynamic>();
//   data['title']= title;
//   data['link']=link;
//   data['thumb_url']=thumb_url;
//   return data;
// }
// }