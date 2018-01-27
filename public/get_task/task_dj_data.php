<?php
date_default_timezone_set('Asia/Shanghai');
//date_default_timezone_set('PRC'); //设置中国时区 
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
//获取任务队列
//select * from cmf_taskdjdata where get_host='' and task_time>'20' and task_time<'35' order by rand() limit 2
// $sql_ip="SELECT * FROM cmf_taskdjdata";//
// $result1=mysql_query($sql_ip);  //->fetchAll(PDO::FETCH_ASSOC);
// $r_data="";
// while($row = mysql_fetch_assoc($result1)){
//     $uid=$row['id'];  //ID编号
//     $sou=$row['sou']; //base64_decode($row['sou']); //搜索引擎
//     $key=$row['key']; //base64_decode($row['key']);  //搜索关键字
//     $title=$row['title'];  //base64_decode($row['title']);  //网站标题
//     $top=$row['top'];  //查询页数
//     $baidu_cookie=$row['baidu_cookie'];  //百度cookie
//     $r_data=sprintf("%s{\"sou\":\"%s\",\"key\":\"%s\",\"title\":\"%s\",\"uid\":\"%s\",\"top\":\"%s\",\"baidu_cookie\":\"%s\"},"
//     ,$r_data ,$sou,$key,$title,$uid,$top,$baidu_cookie);
//     //{"sou":"baidu","key":"seo技术","title":"SEO技术-SEO培训-小鸡SEO技术培训","uid":"123451"},
//     $sql="update cmf_taskdjdata set get_host='$host',get_host_ip='$client_ip',get_time='$time_sjc' where id='$uid'";  //修改数据
//     mysql_query($sql);
// }

function link_sqlx($beng,$end) {  //获取数据
global $time_sjc,$host,$client_ip;
  //select * from cmf_taskdjdata where get_host='' and task_time>'20' and task_time<'35' order by rand() limit 2
$sql_ip="select * from cmf_taskdjdata where get_host='' and delete_time='' and task_time>'$beng' and task_time<'$end' order by rand() limit 10";  //"SELECT * FROM cmf_taskdjdata";//
//print_r($sql_ip);
$result1=mysql_query($sql_ip);  //->fetchAll(PDO::FETCH_ASSOC);
$r_data="";
while($row = mysql_fetch_assoc($result1)){
    $uid=$row['id'];  //ID编号
    $sou=$row['sou']; //base64_decode($row['sou']); //搜索引擎
    $key=$row['key']; //base64_decode($row['key']);  //搜索关键字
    $title=$row['title'];  //base64_decode($row['title']);  //网站标题
    $top=$row['top'];  //查询页数
    $baidu_cookie=$row['baidu_cookie'];  //百度cookie
    $r_data=sprintf("%s{\"sou\":\"%s\",\"key\":\"%s\",\"title\":\"%s\",\"uid\":\"%s\",\"top\":\"%s\",\"baidu_cookie\":\"%s\"},"
    ,$r_data ,$sou,$key,$title,$uid,$top,$baidu_cookie);
    //{"sou":"baidu","key":"seo技术","title":"SEO技术-SEO培训-小鸡SEO技术培训","uid":"123451"},
    $sql="update cmf_taskdjdata set get_host='$host',get_host_ip='$client_ip',get_time='$time_sjc' where id='$uid'";  //修改数据
    mysql_query($sql);
}
  return $r_data;
}

function print_data($r_data) {  //返回展示数据
    $json_data=sprintf("{\"task_dj_data\":[%s]}",substr($r_data,0,strlen($r_data)-1));
    print_r("####");
    print_r($json_data);
    print_r("####");
}

//============================================
//获取  前5个小时任务  
$beng=date("Y-m-d H:i:s",strtotime("-5 hour"));
$end=date("Y-m-d H:i:s",strtotime("-2 hour"));
// echo $beng,"===",$end;
// echo "---",strtotime($beng),"===",strtotime($end);
$r_data=link_sqlx(strtotime($beng),strtotime($end));  //获取数据
if (strlen($r_data)>=5){
    echo $beng,"===",$end;
    print_data($r_data);   //返回展示数据
    return;
}
//============================================
//获取  前2小时任务  
$beng=date("Y-m-d H:i:s",strtotime("-2 hour"));
$end=date("Y-m-d H:i:s",strtotime("-1 hour"));
$r_data=link_sqlx(strtotime($beng),strtotime($end));  //获取数据
if (strlen($r_data)>=5){
    echo $beng,"===",$end;
    print_data($r_data);   //返回展示数据
    return;
}
//============================================
//获取  前1小时任务
$beng=date("Y-m-d H:i:s",strtotime("-1 hour"));
$end=date("Y-m-d H:i:s");
$r_data=link_sqlx(strtotime($beng),strtotime($end));  //获取数据
if (strlen($r_data)>=5){
    echo $beng,"===",$end;
    print_data($r_data);   //返回展示数据
    return;
}
//============================================
//============================================
//============================================
//============================================
//============================================
//============================================