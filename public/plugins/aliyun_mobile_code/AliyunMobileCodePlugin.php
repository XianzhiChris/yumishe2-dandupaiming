<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace plugins\aliyun_mobile_code;//Demo插件英文名，改成你的插件英文就行了
use cmf\lib\Plugin;

/**
 * MobileCodeDemoPlugin
 */
class AliyunMobileCodePlugin extends Plugin
{

    public $info = [
        'name'        => 'AliyunMobileCode',
        'title'       => '阿里云云通讯短信验证码',
        'description' => 'QQ276906866',
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
    public function sendMobileVerificationCode($param)
    {
        $mobile        = $param['mobile'];//手机号
        $code          = $param['code'];//验证码
        $config        = $this->getConfig();
        $expire_minute = intval($config['expire_minute']);
        $expire_minute = empty($expire_minute) ? 30 : $expire_minute;
        $expire_time   = time() + $expire_minute * 60;
        $result        = false;

//        $result = [
//            'error'     => 1,
//            'message' => '服务商返回结果错误'
//        ];

//        $result = [
//            'error'     => 0,
//            'message' => '演示插件,您的验证码是'.$code
//        ];
        require_once "SmsDemo.php";
        $smssend=new \SmsDemo($config['AccessKeyId'],$config['AccessKeySecret']);
        $result = $smssend->sendSms(
            $config['SignName'], // 短信签名
            $config['TemplateCode'], // 短信模板编号
            $mobile, // 短信接收者
            Array(  // 短信模板中字段的值
                "code"=>$code
            )
        );
        $result = [
            'error'     => 0,
            'message' => '验证码发送成功'
        ];
        return $result;
    }

}