<?php

//获取客户端ip
function get_request_ip(){
    if (getenv("HTTP_CLIENT_IP")){
        $rq_ip = getenv("HTTP_CLIENT_IP");
    } else if(getenv("HTTP_X_FORWARDED_FOR")){
        $rq_ip = getenv("HTTP_X_FORWARDED_FOR");
    } else if(getenv("REMOTE_ADDR")){    
        $rq_ip = getenv("REMOTE_ADDR");    
    }else {
        $rq_ip = "Unknow";
    }
	return $rq_ip;  
}

?>