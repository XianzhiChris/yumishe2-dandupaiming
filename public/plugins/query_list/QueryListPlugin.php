<?php
namespace plugins\query_list;
use cmf\lib\Plugin;
require 'QueryList/vendor/autoload.php';
use QL\QueryList;
/**
 * QueryListPlugin
 */
class QueryListPlugin extends Plugin
{

    public $info = [
        'name'        => 'QueryList',
        'title'       => '必须开启',
        'description' => '必须开启',
        'status'      => 1,
        'author'      => '云鹏',
        'version'     => '1.0'
    ];

    public $has_admin = 0;//插件是否有后台管理界面

    public function install() //安装方法必须实现
    {
        return true;//安装成功返回true，失败false
    }

    public function uninstall() //卸载方法必须实现
    {
        return true;//卸载成功返回true，失败false
    }

    //实现的send_mobile_verification_code钩子方法
    public function sousuoyinqing($parm)
    {
        $key_word=$parm['key'];
        $ssyq=$parm['ssyq'];
        $page=[];
        if($ssyq==1){ //百度
            $page=array(
                "https://www.baidu.com/s?rn=50&wd=".$key_word,
                "https://www.baidu.com/s?rn=50&wd=".$key_word."&pn=50"
            );
            $data=array();
            foreach($page as $p){
                $html=$this->curl_get_contents($p);
                $reg = array(
                    'title' => array('h3 a','text'),
                    'url'=>array('.f13 .c-showurl','text')
                );
                $rang = '#content_left .result';
                $ql = QueryList::Query($html,$reg,$rang);
                $data = array_merge($data,$ql->getData());
            }
        }
        if($ssyq==2){ //搜狗
            $page=array(
                "https://www.sogou.com/web?num=100&query=".$key_word
            );
            $data=array();
            foreach($page as $p){
                $html=$this->curl_get_contents($p);
                $reg = array(
                    'title' => array('h3 a','text'),
                    'url'=>array('.fb cite','text')
                );
                $rang = '.results>div';
                $ql = QueryList::Query($html,$reg,$rang);
                $data = array_merge($data,$ql->getData());
            }
        }
        if($ssyq==3){ //360
            $page=array(
                "https://www.so.com/s?q=".$key_word,
                "https://www.so.com/s?q=".$key_word."&pn=2",
                "https://www.so.com/s?q=".$key_word."&pn=3",
                "https://www.so.com/s?q=".$key_word."&pn=4",
                "https://www.so.com/s?q=".$key_word."&pn=5",
                "https://www.so.com/s?q=".$key_word."&pn=6",
                "https://www.so.com/s?q=".$key_word."&pn=7",
                "https://www.so.com/s?q=".$key_word."&pn=8",
                "https://www.so.com/s?q=".$key_word."&pn=9",
                "https://www.so.com/s?q=".$key_word."&pn=10"
            );
            $data=array();
            foreach($page as $p){
                $html=$this->curl_get_contents($p);
                $reg = array(
                    'title' => array('h3 a','text'),
                    'url'=>array('.res-linkinfo cite','text')
                );
                $rang = '#main .res-list';
                $ql = QueryList::Query($html,$reg,$rang);
                $data = array_merge($data,$ql->getData());
            }
        }
        if($ssyq==4){//百度知道
            $page=array(
                "https://zhidao.baidu.com/search?pn=0&word=".$key_word,
                "https://zhidao.baidu.com/search?pn=10&word=".$key_word,
                "https://zhidao.baidu.com/search?pn=20&word=".$key_word,
                "https://zhidao.baidu.com/search?pn=30&word=".$key_word,
                "https://zhidao.baidu.com/search?pn=40&word=".$key_word
            );
            $data=array();
            foreach($page as $p){
                $html=$this->curl_get_contents($p);
                $reg = array(
                    'title' => array('dt a','text'),
                    'url'=>array('.dt a','href')
                );
                $rang = '#wgt-list .dl';
                $ql = QueryList::Query($html,$reg,$rang,'UTF-8','GBK');
                $data = array_merge($data,$ql->getData());
            }
        }
        if($ssyq==5){//5118
            $page=array(
                "http://www.5118.com/seo/baidurank/".$key_word
            );
            $data=array();
            foreach($page as $p){
                $html=$this->curl_get_contents($p);
                $reg = array(
                    'key' => array('.hoverToHide a','text'),
                    'num'=>array('.rank a','text'),
                    'zhishu'=>array('dd:eq(3)','text'),
                    'jingjia'=>array('dd:eq(5) a','text'),
                    'biaoti'=>array('dd:eq(6) a','text')
                );
                $rang = '#waci-wrap .dig-list dl';
                $ql = QueryList::Query($html,$reg,$rang);
                $data = array_merge($data,$ql->getData());
            }
        }

        return json_encode($data);
    }

    function curl_get_contents($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);            //设置访问的url地址
        //curl_setopt($ch,CURLOPT_HEADER,1);            //是否显示头部信息
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);           //设置超时
        curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0; QQBrowser/7.2.7006.400)");   //用户访问代理 User-Agent
        //curl_setopt($ch, CURLOPT_REFERER,_REFERER_);        //设置 referer
        curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);      //跟踪301
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);        //返回结果
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   //HTTS请求
        $r = curl_exec($ch);
        curl_close($ch);
        return $r;
    }
}