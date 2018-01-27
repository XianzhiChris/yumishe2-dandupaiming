<?php

@$cookie_md5=$_GET["cookie_md5"];  //

include("conn.php");
$sql="update cmf_zhidaobaiducook set cookie_fail=cookie_fail+1 where cookie_md5='$cookie_md5'";  //修改数据
mysql_query($sql);
