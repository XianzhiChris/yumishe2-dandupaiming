<?php

//=================================
$conn = @mysql_connect('localhost', 'root', 'root') or die("xxxooo!!!");  //连接数据库

mysql_select_db('yumishe',$conn) or die("oooxxx!!!");  //打开数据
mysql_query("set names 'GBK'"); //使用GBK中文编码;
//=================================

?>
