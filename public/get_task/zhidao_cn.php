<?php
//知道自动采纳
@$id=$_GET["uid"];  //任务ID
@$user_id=$_GET["user_id"];  //用户ID
@$return_code=$_GET["return_code"];  //状态4  成功  失败
@$url=urldecode(base64_decode($_GET["url"]));  //url地址

/** 二进制流生成文件 
    * $_POST 无法解释二进制流，需要用到 $GLOBALS['HTTP_RAW_POST_DATA'] 或 php://input 
    * $GLOBALS['HTTP_RAW_POST_DATA'] 和 php://input 都不能用于 enctype=multipart/form-data 
    * @param    String  $file   要生成的文件路径 
    * @return   boolean 
*/  
function binary_to_file($file){  
        $content = $GLOBALS['HTTP_RAW_POST_DATA'];  // 需要php.ini设置  
        if(empty($content)){  
            $content = file_get_contents('php://input');    // 不需要php.ini设置，内存压力小  
        }  
        $ret = file_put_contents($file, $content, true);  
        return $ret;  
    }      

include("conn.php");

if ($id=="" or $url=="" or $user_id==""){

	//===================================  点赞成功
	if ($return_code=="4"){
		$time=strtotime(date('Y-m-d H:i:s'));
		$format = 'img/%s_%s.png';
	    $return_img=sprintf($format, $id, $time);
	    binary_to_file($return_img);
	    $sql="update cmf_zhidaotaskdata set return_code='$return_code',return_img='$return_img' where id='$id'";  //修改数据
		mysql_query($sql);
	}
	//===================================

    print_r("data name null");
    //break;
    //return都是终止的一段程序
    exit;  //是全部终止
}



//==========================
//host 更新主机信息
mysql_query("SET AUTOCOMMIT=1"); //设置mysql不自动提交，需自行用commit语句提交 

$sql="select * from cmf_zhidaotaskdata where zhidao='tw' and user_id='$user_id' and return_url like '$url%'";  //添加数据
$result1=mysql_query($sql);
$baidu_cookie="";
//$link_int=0;
while($row = mysql_fetch_assoc($result1)){
	$baidu_cookie=$row['baidu_cookie'];  //id
}

if ($baidu_cookie!=""){
echo "---";
echo $baidu_cookie;
echo "---";
}else{

}
//http://xxxx.cc/get_task/zhidao_cn.php?uid=123&user_id=0&url=aHR0cHM6Ly96aGlkYW8uYmFpZHUuY29tL3F1ZXN0aW9uLzE5Mjk0ODM5MTUwMzkwNTk1NDcuaHRtbA==
