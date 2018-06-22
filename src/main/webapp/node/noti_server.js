var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var mysql = require('mysql');


http.listen(3001,function(){    // 포트 열어주기
    console.log("알림서버 포트 온 : 3001");
});

io.on('connection',function(socket){
    
    socket.on("test",function(data){
        console.log("Test")
    })
    socket.on("join",function(data){
        
        selectNotiList(data,data+"join");
    })
    socket.on("requsetNoti",function(data){
        insertNoti(data,data.noti_res_no+"noti");
    });
    socket.on("requsetNotiByProject",function(data){
        insertNotiByProject(data,data.noti_res_no+"noti");
    });
    socket.on("insertProjectParticipant",function(data){
        insertProjectParticipant(data);
    }); 
    socket.on("deleteNoti",function(data){
        deleteNoti(data);
    });
    socket.on("viewNoti",function(data){
        viewNoti(data);
    });

    socket.on('disconnect',function(){
        console.log("디커넥") 
    })
})




// mysql properties
var conn = mysql.createConnection({
    host     :'project-lac.cgp1qdd6o5kc.us-east-2.rds.amazonaws.com', 
    user     :'admin',
    password :'bitcamp!!!',  
    database :'project_lac'  
    // port: 포트 번호 입력 필요한데 아마존은 도메인 자체로 접근 가능
  });

// mysql query  
var selectNotiList = function (data,key){
    let sql = `
        select n.*,u.*
          from tb_notification as n
         inner join tb_user as u
            on n.noti_req_no = u.user_no
         where n.noti_res_no = ?
         order by noti_req_date desc
    `;
    conn.query(sql,data,function(err,result) {
        if(err) {throw new Error(err);}
        io.emit(key,result);
    });
}

var newNotiCnt = function (data){
    let sql = `
    select count(*)
      from tb_notification
     where noti_res_no = ?
       and noti_state_code = '00204'
    `;
    conn.query(sql,data[0],function(err,result) {
        if(err) {throw new Error(err);}
        io.emit(data[1],result);
    });
}

var deleteNoti = function (data){
    let sql = `
    delete
      from tb_notification
     where noti_no = ?
    `;
    conn.query(sql,data[0],function(err,result) {
        if(err) {throw new Error(err);}
        newNotiCnt(data);
    });
}

var viewNoti = function (data){
    let sql = `
    update tb_notification
       set noti_state_code = '00203'
     where noti_no = ?
    `;
    conn.query(sql,data[0],function(err,result) {
        if(err) {throw new Error(err);}
        newNotiCnt(data);
    });
}

var insertNoti = function (data,key){
    let sql1 = `
    delete
      from tb_notification
     where noti_type_code = ?
       and noti_req_no = ?
       and noti_res_no = ?
    `;
    let sql2 = `
        insert into tb_notification(
               noti_type_code,
               noti_req_no,
               noti_res_no
        )
        values(
               ?,
               ?,
               ?
        )
    `;
    
    conn.query(sql1,data.sql,function(err,result) {
        if(err) {throw new Error(err);}
        else{
            conn.query(sql2,data.sql,function(err,result) {
                if(err) {throw new Error(err);}
                else{
                    io.emit(key,data);
                }
            });   
        }
    });   
}

var insertNotiByProject = function (data,key){
    let sql1 = `
    delete
      from tb_notification
     where noti_type_code = ?
       and noti_res_no = ?
       and project_no = ?
    `;
    let sql2 = `
        insert into tb_notification(
               noti_type_code,
               noti_req_no,
               noti_res_no,
               project_no,
               noti_attach_msg
        )
        values(
               ?,
               ?,
               ?,
               ?,
               ?
        )
    `;
    
    conn.query(sql1,data.sql1,function(err,result) {
        if(err) {throw new Error(err); }
        else{
            conn.query(sql2,data.sql2,function(err,result) {
                if(err) {throw new Error(err);}
                else{
                    io.emit(key,data);
                }
            });   
        }
    });   
}

var insertProjectParticipant = function (data,key){
    let sql1 = `
    delete
      from tb_notification
     where noti_res_no = ?
       and project_no = ?
    `;
    let sql2 = `
        insert into tb_project_participant(
            user_no,
            project_no
        )
        values(
               ?,
               ?
        )
    `;
    
    conn.query(sql1,data,function(err,result) {
        if(err) {throw new Error(err);}
        else{
            conn.query(sql2,data,function(err,result) {
                if(err) {throw new Error(err);}
            });   
        }
    });   
}