

**Maven Project LAC**
===============
**Learning And Code**



최운영(https://github.com/uyCHOI)<br>
정진솔(https://github.com/smokerJS)<br>
이은비(https://github.com/eunbeeLee)<br>


---------------------------------------


>**Server-side**<br>
>Spring Framework ***80port***<br>
>Node.js express ***3000,3001port***<br>
>socket.io (***실시간 서버 구성 3000 : 채팅 / 3001 :  알림*** )<br>
>vid-streamer ***3002port***<br>
><br>

>**DBMS**<br>
MySQL<br>
AWS RDS <br><br>

>**Tools**<br>
Eclipse<br>
VSCode<br>
MySQLWorkbench <br>
Balsamiq Mockups 3<br><br>

>**UI-Framework**<br>
sitemesh-3<br>
Bootstrap4<br><br>

>**FE-lib**<br>
jquery<br><br>

>**Version management**<br>
SourceTree<br>
(https://github.com/eunbeeLee/maven_project_lac)<br>

---------------------------------------
![Alt Text](./readMeImg/1_member.png)

---------------------------------------

>**정진솔 - UI-Design / 채팅 / 실시간 알림 /  친구관리 / 프로젝트 생성**
>---------
>
>***node.js*** 의 **socket.io** 를 이용하여 실시간 통신 서비스 및<br>
>***Spring Framework*** 와 **Node Express** 의 **Cross Browsing** 구현<br>
>Web template 을 사용하지 않고 로그인을 제외한 모든 페이지에<br>
>***app*** 형식의 **UI-Design** 과 sitemesh를 통한 **Side Menu** 구성<br>
><br><br>
> **핵심기능**<br>
>    - 실시간 알림<br>
>    - 친구관리<br>
>    - 프로젝트 생성 및 초대<br>
>    - 채팅<br>
>    <br>
   
---------------------------------------

>Main View
>---------
>![Alt Text](./readMeImg/2_server.png)
><br><br>
>![Alt Text](./readMeImg/3_main.png)<br>
>
>**간편한 프로젝트 생성과 다양한 기능의 채팅 서비스**<br><br>
>project lac 는 간단하게 블록코딩을 즐기며<br>
>친구들과 채팅을 할 수 있는 유용한 웹서비스 입니다.<br>

---------------------------------------

>실시간 알림과 함께하는 친구관리와 프로젝트 생성 및 초대
>---------
>![Alt Text](./readMeImg/4_project1.gif)<br><br>
>![Alt Text](./readMeImg/5_project2.png)<br><br>
**두가지의 서버에서 데이터를 주고받는 방식**
>
>---------
>![Alt Text](./readMeImg/6_friends.gif)
><br><br>
>**친구신청 & 수락**<br><br>
>친구 신청과 수락은 Spring Framework 를 구동하는 80 port 에 데이터를 전송하여 처리하고<br>
>실시간 알림을 위해 3001 port 를 사용하는 알림 전용 서버로 동시에 데이터를 전송한다.<br>
>각 서버가 서로 다른 처리를 하여 더욱 효율적인 처리가 가능하다.<br>
>
>---------
>![Alt Text](./readMeImg/7_create.gif)<br><br>
>**간단한 프로젝트 생성과 탈퇴**<br><br>
>직관적인 UI와 최소한의 정보로 프로젝트를 생성하고 탈퇴한다.<br>
>
>---------
>![Alt Text](./readMeImg/8_req.gif)<br><br>
>**실시간으로 프로젝트 초대장 발송**<br><br>
>초대받은 유저가 바로 인지하기 위하여<br>
>오른쪽 하단 알림창에 초대장 발송 내역이 즉시 보인다.<br>

---------------------------------------

>다양한 기능의 채팅
>---------
>![Alt Text](./readMeImg/9_chat1.gif)
>
>---------
>![Alt Text](./readMeImg/10_chat2.gif)<br>
>
>**채팅방 알림**<br><br>
>채팅방 입장 알림과 이전 채팅 내용을 확인할 때<br>
>새로운 메세지를 전송받으면 해당 메세지의 정보를 알려준다.<br>
>
>---------
>![Alt Text](./readMeImg/11_emo.gif)<br>
>
>**100여가지 이상의 이모티콘**<br><br>
>가지각색의 이모티콘으로 상황에 맞는 의사표현이 가능하다.<br>
>이모티콘은 버튼 하나만 누르면 간단하게 사용이 가능하다.<br>
>
>---------
>![Alt Text](./readMeImg/12_file.gif)<br>
>
>**빠르고 간편한 파일 첨부와 다운로드**<br><br>
>node.js 의 express 에 multer middleware 를 사용하여<br>
>쉽고 빠른 업 & 다운로드를 구현하였다.<br>
>
>---------
>![Alt Text](./readMeImg/13_video.gif)<br>
>
>**동영상 업로드와 실시간 스트리밍 서비스**<br><br>
>또한 node.js 서버단에 vid-streamer 를 이용하여 스트리밍 전용 서버를 구성하고<br>
>사용자는 브라우저가 동영상을 읽는 동시에 동영상 시청이 가능하다.<br>
>
>---------
>![Alt Text](./readMeImg/14_poto1.gif)<br>
>
>**사진첨부는 File API 를 이용한 빠른 미리보기와 다운로드를 제공**<br><br>
>여러가지 사진을 한번에 첨부할 수 있다.<br>
>사진첨부는 파일/동영상과 달리 Spring 서버단에서 읽기 쓰기가 이루어진다.<br>
><br><br><br>
>
>![Alt Text](./readMeImg/15_poto2.png)<br><br>
>1. 첨부와 동시에 javascript에서 File API로 해당 이미지를 읽어 socket 통신을 진행<br>
>2. spring 서버단에서 DB에 정보를 입력하고 파일쓰기 진행<br>
>3. 브라우저로 File API에서 읽어낸 미리보기 정보 전송/첨부 이미지 확인<br>
>4. spring 서버단에서 파일쓰기가 완료되면 브라우저로 해당 정보 전송<br>
>5. 쓰기가 완료된 이미지들의 다운로드 활성화<br>
><br>
>
> 파일 및 동영상은 ***node*** 서버단에서 읽고 쓰지만 사진의 읽기 쓰기는 ***spring*** 에서 진행되며<br>
> 파일 읽기는 google 의 guava lib 를 이용하였다.<br>
> 채팅방에 참여한 유저들이 다수의 파일 쓰기가 끝나기 전에  이미지를 확인하는<br>
> **비동기적 읽기/쓰기 방식을 개발** <br>
>
>---------

---------------------------------------



>프로젝트 구조
>---------
>**domain / controller / service / impl**<br>
>
>![Alt Text](./readMeImg/16_controller.png)<br><br>
>![Alt Text](./readMeImg/17_service.png)<br><br>

---------------------------------------
>ERD - [MySQL]
>---------
>
>![Alt Text](./readMeImg/18_erd.png)<br><br>

---------------------------------------



>버젼관리
>---------
>**소스트리를 사용하여 수정 및 업데이트가 있을때마다 수시로 관리**<br>
>
>![Alt Text](./readMeImg/19_source.gif)<br>

---------------------------------------

***maven_project_lac v 1.0***