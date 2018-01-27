<?php
@$uid=$_GET["uid"];  //任务ID
@$return_click=$_GET["return_click"];  //返回1为点击成功   返回0为点击失败
@$return_title=$_GET["return_title"];    //返回标题
@$return_top=$_GET["return_top"];    //返回点击页数

$time=strtotime(date('Y-m-d H:i:s'));

include("get_ip.php");
@$client_ip=get_request_ip();  //获取客户端ip

include("conn.php");
$sql="update cmf_taskdjdata set return_click='$return_click',return_title='$return_title',return_top='$return_top',return_ip='$client_ip',return_time='$time' where id='$uid'";  //修改数据
mysql_query($sql);
