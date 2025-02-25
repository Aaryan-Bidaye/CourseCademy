import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 渐变背景部分
            Container(
              height: 300, // 增加渐变背景的高度
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 242, 179, 1),
                    Colors.white, // 渐变色过渡到白色
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.8], // 控制渐变范围
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50, // 头像大小
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // 用户头像
                    ),
                    SizedBox(width: 16), // 添加间距
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Username', // 用户名
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '1000 Subscribers', // 订阅人数
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // 处理订阅逻辑
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 210, 2, 1), // 按钮颜色
                          ),
                          child: Text('Subscribe'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // 视频列表部分
            Container(
              color: Colors.white, // 设置视频列表的背景色为白色
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Videos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // 视频项示例
                  VideoItem(
                    thumbnailUrl: 'https://via.placeholder.com/150',
                    title: 'Video Title 1',
                    views: '1,000 views',
                  ),
                  VideoItem(
                    thumbnailUrl: 'https://via.placeholder.com/150',
                    title: 'Video Title 2',
                    views: '500 views',
                  ),
                  VideoItem(
                    thumbnailUrl: 'https://via.placeholder.com/150',
                    title: 'Video Title 3',
                    views: '200 views',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 视频项组件
class VideoItem extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String views;

  VideoItem({
    required this.thumbnailUrl,
    required this.title,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Row(
        children: [
          Image.network(
            thumbnailUrl,
            width: 120,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 120,
                height: 80,
                color: Colors.grey,
                child: Icon(Icons.error),
              );
            },
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  views,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
