<?php

//获取任务队列
@$host=$_GET["host"];  //服务器名称
@$time_sjc=time();  //获取时间戳

if ($host==""){
    print_r("host name null");
    //break;
    //return都是终止的一段程序
    exit;  //是全部终止
}
include("get_ip.php");
@$client_ip=get_request_ip();  //获取客户端ip

include("conn.php");

//==========================
//host 更新主机信息
mysql_query("SET AUTOCOMMIT=1"); //设置mysql不自动提交，需自行用commit语句提交 

$sql="insert into cmf_host(name,out_time,client_ip) VALUES('$host','$time_sjc','$client_ip')";  //添加数据

if (mysql_query($sql)){
}else{
    $sql="update cmf_host set out_time='$time_sjc',client_ip='$client_ip' where name='$host'";  //修改数据
    mysql_query($sql);
}
//==========================
//==========================
//获取任务队列
//select * from cmf_zhidaotaskdata where get_host='' order by rand() limit 30          SELECT * FROM cmf_zhidaotaskdata
$sql_ip="select * from cmf_zhidaotaskdata where get_host=''and delete_time='' order by rand() limit 30";//
$result1=mysql_query($sql_ip);  //->fetchAll(PDO::FETCH_ASSOC);
$r_data="";
//$link_int=0;
while($row = mysql_fetch_assoc($result1)){
    $uid=$row['id'];  //id
    $zhidao=$row['zhidao'];  //tw百度知道提问   hd百度知道回答
    $title=$row['title'];  //提问 标题
    $get_url=$row['get_url'];  //回答URL
    $content=$row['content'];  //回答   提问   内容
    $baidu_cookie=$row['baidu_cookie'];  //baidu_cookie
    $is_ok=$row['is_ok'];  //is_ok  1是最佳答案
    $user_id=$row['user_id'];  //user_id  用户ID
    $r_data=sprintf("%s{\"uid\":\"%s\",\"zhidao\":\"%s\",\"title\":\"%s\",\"get_url\":\"%s\",\"content\":\"%s\",\"baidu_cookie\":\"%s\",\"is_ok\":\"%s\",\"user_id\":\"%s\"},"
    ,$r_data,$uid ,$zhidao,$title,$get_url,$content,$baidu_cookie,$is_ok,$user_id);

    $sql="update cmf_zhidaotaskdata set get_host='$host',get_host_ip='$client_ip',get_host_time='$time_sjc' where id='$uid'";  //修改数据
    mysql_query($sql);

    //$link_int=$link_int++;
}

//============================================
//返回任务
if (strlen($r_data)>=5){
    //if ($link_int<=1){
        $json_data=sprintf("{\"task_zhidao_data\":[%s]}",substr($r_data,0,strlen($r_data)-1));
    // }else{
    //     $json_data=sprintf("{\"task_zhidao_data\":[%s]}",substr($r_data,0,strlen($r_data)-1));
    // }
    
    print_r("####");
    print_r($json_data);
    print_r("####");
}

