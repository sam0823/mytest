//
//  RequestUrl.h
//
//  Created by ss on 16/6/27.
//  Copyright © 2016年 ss. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h

//Dota全部主播请求url:
#define DotaAllHosterResquest_url @"http://api.dotaly.com/api/v1/authors?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0"

//LOL全部主播请求url:
#define LOLAllHosterRequest_url @"http://api.dotaly.com/lol/api/v1/authors?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E"

//DOTA 单个主播所有视频
#define DotaSingleAuthorAllVideoRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/shipin/latest?author=%@&iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&limit=50", ID]

//LOL 单个主播所有视频
#define LOLSingleAuthorAllVideoRequest_Url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/shipin/latest?author=%@&iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&limit=50",ID]
//Dota 视频地址
#define DotaAuthorSimpleVideoRequest_url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/api/v1/getvideourl?iap=0&ident=F5D9CA17-1E5C-4B19-8727-4C3A51B77596&jb=0&type=mp4&vid=%@",ID]

//LOL 视频地址:
#define LOLAuthorSimpleRequest_url(ID) [NSString stringWithFormat:@"http://api.dotaly.com/lol/api/v1/getvideourl?iap=0&ident=408A6C12-3E61-42EE-A6DB-FB776FBB834E&jb=0&type=flv&vid=%@",ID]



//活动详情URL(动态)
//#define ActivityDetailRequest_url(id) [NSString stringWithFormat:@"http://api.douban.com/v2/event/%@/photos?count=5&apikey=062bcf31694a52d212836d943bdef876",ID]






//电影详情URL(动态)
//#define MovieDetailRequest_url(id) [NSString stringWithFormat:@"http://api.douban.com/v2/movie/subject/%@?apikey=0df993c66c0c636e29ecbb5344252a4a&client=e:iPhone4,1%%7Cy:iPhoneOS_6.1%7Cs:mobile%%7Cf:doubanmovie_2%%7Cv:3.3.1%%7Cm:PP_market%%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%%E5%%8C%%97%%E4%%BA%%AC&version=2&app_name=doubanmovie",ID]











#endif /* RequestUrl_h */
