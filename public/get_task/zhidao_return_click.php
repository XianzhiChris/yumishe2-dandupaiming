<?php
@$uid=$_GET["uid"];  //任务ID
@$return_code=$_GET["return_code"];  //状态  成功  失败
@$return_err=$_GET["return_err"];   //原因
@$return_url=$_GET["return_url"];    //url地址
$return_img="";    //$_GET["return_img"];  //图片地址

$time=strtotime(date('Y-m-d H:i:s'));
//return_time
include("get_ip.php");
@$client_ip=get_request_ip();  //获取客户端ip


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

if ($return_code=="1"){
    $format = 'img/%s_%s.png';  
    $return_img=sprintf($format, $uid, $time); 
    binary_to_file($return_img);  
}


include("conn.php");

$sql="update cmf_zhidaotaskdata set return_time='$time',return_code='$return_code',return_err='$return_err',return_url='$return_url',return_img='$return_img' where id='$uid'";  //修改数据
mysql_query($sql);
