<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Powerless < wzxaini9@gmail.com>
// +----------------------------------------------------------------------
namespace app\user\model;

use think\Db;
use think\Model;

class UserModel extends Model
{
    public function doMobile($user)
    {
        $userQuery = Db::name("user");

        $result = $userQuery->where('mobile', $user['mobile'])->find();

        if (!empty($result)) {
            if (cmf_compare_password($user['user_pass'], $result['user_pass'])) {
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        return 2;
    }

    public function doName($user)
    {
        $userQuery = Db::name("user");

        $result = $userQuery->where('user_login', $user['user_login'])->find();

        if (!empty($result)) {
            if (cmf_compare_password($user['user_pass'], $result['user_pass'])) {
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        return 2;
    }

    public function doEmail($user)
    {
        $userQuery = Db::name("user");

        $result = $userQuery->where('user_email', $user['user_email'])->find();

        if (!empty($result)) {
            if (cmf_compare_password($user['user_pass'], $result['user_pass'])) {
                session('user', $result);
                $data = [
                    'last_login_time' => time(),
                    'last_login_ip'   => get_client_ip(0, true),
                ];
                $userQuery->where('id', $result["id"])->update($data);
                return 0;
            }
            return 1;
        }
        return 2;
    }

    public function registerEmail($user)
    {
        $userQuery = Db::name("user");
        $result    = $userQuery->where('user_email', $user['user_email'])->find();

        $userStatus = 1;

        if (cmf_is_open_registration()) {
            $userStatus = 2;
        }

        if (empty($result)) {
            $data   = [
                'user_login'      => '',
                'user_email'      => $user['user_email'],
                'mobile'          => '',
                'user_nickname'   => '',
                'user_pass'       => cmf_password($user['user_pass']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => $userStatus,
                "user_type"       => 2,
            ];
            $userId = $userQuery->insertGetId($data);
            $date   = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($date);
            return 0;
        }
        return 1;
    }

    public function registerMobile($user)
    {
        $result = Db::name("user")->where('mobile', $user['mobile'])->find();


        if (cmf_is_open_registration()) {
            $userStatus = 2;
        }

        if (empty($result)) {
            $data   = [
                'user_login'      => '',
                'user_email'      => '',
                'mobile'          => $user['mobile'],
                'user_nickname'   => '',
                'user_pass'       => cmf_password($user['user_pass']),
                'last_login_ip'   => get_client_ip(0, true),
                'create_time'     => time(),
                'last_login_time' => time(),
                'user_status'     => $userStatus,
                "user_type"       => 2,//会员
                "parent_id"       => $user['parent_id'],//推荐者ID
            ];
            $userId = Db::name("user")->insertGetId($data);
            $data   = Db::name("user")->where('id', $userId)->find();
            cmf_update_current_user($data);
            //将上级提升为队长
            Db::name("user")->where('id', $user['parent_id'])->update(['is_duizhang'=>1]);
            return 0;
        }
        return 1;
    }

    /**
     * 通过邮箱重置密码
     * @param $email
     * @param $password
     * @return int
     */
    public function emailPasswordReset($email, $password)
    {
        $result = $this->where('user_email', $email)->find();
        if (!empty($result)) {
            $data = [
                'user_pass' => cmf_password($password),
            ];
            $this->where('user_email', $email)->update($data);
            return 0;
        }
        return 1;
    }

    /**
     * 通过手机重置密码
     * @param $mobile
     * @param $password
     * @return int
     */
    public function mobilePasswordReset($mobile, $password)
    {
        $userQuery = Db::name("user");
        $result    = $userQuery->where('mobile', $mobile)->find();
        if (!empty($result)) {
            $data = [
                'user_pass' => cmf_password($password),
            ];
            $userQuery->where('mobile', $mobile)->update($data);
            return 0;
        }
        return 1;
    }

    public function editData($user)
    {
        $userId           = cmf_get_current_user_id();
//        $user['birthday'] = strtotime($user['birthday']);
        $userQuery        = Db::name("user");
        if ($userQuery->where('id', $userId)->update($user)) {
            $data = $userQuery->where('id', $userId)->find();
            cmf_update_current_user($data);
            return 1;
        }
        return 0;
    }

    /**
     * 用户密码修改
     * @param $user
     * @return int
     */
    public function editPassword($user)
    {
        $userId    = cmf_get_current_user_id();
        $userQuery = Db::name("user");
        if ($user['password'] != $user['repassword']) {
            return 1;
        }
        $pass = $userQuery->where('id', $userId)->find();
        if (!cmf_compare_password($user['old_password'], $pass['user_pass'])) {
            return 2;
        }
        $data['user_pass'] = cmf_password($user['password']);
        $userQuery->where('id', $userId)->update($data);
        return 0;
    }
    public function tuandui()
    {
        $userId               = cmf_get_current_user_id();
        $userMoneyQuery            = Db::name("user_money_log");

        $userQuery            = Db::name("user");
        $where['parent_id']     = $userId;
        $favorites            = $userQuery->where($where)->whereOr('id',$userId)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();

        $list=[];
        //时间区间：今年
        $s=mktime(0,0,0,1,1,date('Y',time()));  //年初
        $e=mktime(23,59,59,12,31,date('Y',time()));   //年末
        foreach($favorites as $v){
            $user_group_name=Db::name('user_group')->field('post_title')->where('id',$v['user_group'])->find();
            $je= $userMoneyQuery->field(array('sum(jine)'=>'je'))->where(array('user_id'=>$v['id'],'type'=>1,'create_time'=>['between',[$s,$e]]))->find();
            $v['xiaofei']=$je['je'];
            $v['user_group_name']=$user_group_name['post_title'];
            $list[]=$v;
        }
        $data['lists']        = $list;
        return $data;
    }
    public function tixian()
    {
        $userId               = cmf_get_current_user_id();
        $userTixianQuery            = Db::name("tixian_post");

        $where['user_id']     = $userId;
        $favorites            = $userTixianQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function pinglun()
    {
        $userId               = cmf_get_current_user_id();
        $userPinglunQuery            = Db::name("pinglun_post");

        $where['user_id']     = $userId;
        $where['post_type']     = 1;
        $favorites            = $userPinglunQuery->where($where)->order('id desc')->paginate(10);
        $list=[];

        $userPinglunTaskQuery            = Db::name("zhidaotaskdata");
        foreach($favorites as $v){

            $task_ok_count=$userPinglunTaskQuery->field(array('count(*)'=>'count'))->where(['pinglun_id'=>$v['id'],'return_code'=>['in','1,4']])->select();
            $task_err_count=$userPinglunTaskQuery->field(array('count(*)'=>'count'))->where(['pinglun_id'=>$v['id'],'return_code'=>['in','0,2,3'],'delete_time'=>0])->select();

            $v['task_ok_count']=$task_ok_count[0]['count'];
            $v['task_err_count']=$task_err_count[0]['count'];
            $v['task_ok']=0;
            if($v['post_content_num']==($v['task_ok_count']+$v['task_err_count'])) {//数量相等，任务完成
                $v['task_ok']=1;
            }
            $v['url_num']=count(explode("@@",$v['post_url']));
            $list[]=$v;
        }
        $data['page']         = $favorites->render();

        $data['lists']        = $list;
        return $data;
    }
    public function pinglunadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $str = str_replace(array("\r\n", "\r", "\n", "\t"), "###", $data['pinglun_content']);
        $content_data=explode('###',$str);

        $j=0;
        $jinciQuery=Db::name('pinglun_jinci_post');
        $jinci = $jinciQuery->field('post_title')->where(['delete_time'=>0])->select();

        foreach ($content_data as $v) {
            if (strlen($v) > 1) {
                //内容禁词检测
                if ($jinci) {
                    foreach ($jinci as $val) {
                        if (strpos($v, $val['post_title']) !== false) {
                            return "err:" . $val['post_title'];
                        }
                    }
                }
                $j++;
            }
        }
        if($j>0) {
            $content_num = $j;

            //积分减少
            $jiage=1;
            $jiageQuery=Db::name('user_jiage')->field('huida,huida2')->where('id',1)->find();
            if($data['type']==1){
                $jiage=$jiageQuery['huida'];
            }
            if($data['type']==2){
                $jiage=$jiageQuery['huida2'];
            }
            $userQuery = Db::name("user");
            $where = [];
            $where['id'] = $userId;
            $xiaofei = $content_num * $jiage;
            $coin = $userQuery->where($where)->find();
            $userQuery->where($where)->update(array('score' => $coin['score'] - $xiaofei));

            //增加明细记录
            $userMoneyQuery = Db::name("user_money_log");
            $data2 = [];
            $data2['user_id'] = $userId;
            $data2['create_time'] = time();
            $data2['type'] = 2;
            $data2['post_title'] = '百度知道【' . $data['post_title'] . '】评论任务';
            $data2['score'] = $xiaofei;
            $userMoneyQuery->insert($data2);

            //增加评论
            $userPinglunQuery = Db::name("pinglun_post");
            $pinglun_data = ['cookie_type'=>$data['type'],'post_type' => 1, 'post_title' => $data['post_title'], 'post_content' => '', 'post_url' => $data['post_url'], 'post_content_num' => $content_num, 'user_id' => $userId, 'create_time' => time()];
            $userPinglunQuery->insert($pinglun_data);
            $renwu_id = $userPinglunQuery->getLastInsID();

            //存入内容表
            $time = time();
            $contentQuery = Db::name('pinglun_content_post');
            $renwuQuery = Db::name('zhidaotaskdata');
            $CookieQuery = Db::name('zhidaobaiducook');


            foreach ($content_data as $v) {
                if (strlen($v) > 1) {
                    $is_ok=0;
                    if($v==$data['is_ok_str']){
                        $is_ok=1;
                    }

                    $content_data = ['post_title' => $v, 'pinglun_id' => $renwu_id, 'create_time' => $time];
                    $contentQuery->insert($content_data);
                    $content_id = $contentQuery->getLastInsID();
                    //随机百度cookie
                    $baidu_cookie = $CookieQuery->field('baidu_cookie')->where(['type'=>$data['type'],'cookie_fail'=>['lt', 10],'delete_time'=>0])->order('rand()')->limit(1)->find();
                    //生成任务列表
                    $renwudata = ['user_id'=>$userId,'is_ok'=>$is_ok,'pinglun_id' => $renwu_id, 'title' => base64_encode($data['post_title']), 'content_id' => $content_id, 'zhidao' => 'hd', 'get_url' => $data['post_url'], 'content' => base64_encode($v), 'baidu_cookie' => $baidu_cookie['baidu_cookie'], 'create_time' => $time];
                    $renwuQuery->insert($renwudata);
                }
            }
            return "ok";

        }else{
            return "err:评论内容不能为空";
        }
    }
    public function pinglunPiliangadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $str = str_replace(array("\r\n", "\r", "\n", "\t"), "###", $data['pinglun_content']);
        $content_data=explode('###',$str);

        $j=0;
        $jinciQuery=Db::name('pinglun_jinci_post');
        $jinci = $jinciQuery->field('post_title')->where(['delete_time'=>0])->select();

        foreach ($content_data as $v) {
            if (strlen($v) > 1) {
                //内容禁词检测
                if ($jinci) {
                    foreach ($jinci as $val) {
                        if (strpos($v, $val['post_title']) !== false) {
                            return "err:" . $val['post_title'];
                        }
                    }
                }
                $j++;
            }
        }
        if($j>0) {
            //title数量
            $title_num=count($data['post_title']);
            $content_num = $j;

            //积分减少
            $jiage=1;
            $jiageQuery=Db::name('user_jiage')->field('huida,huida2')->where('id',1)->find();
            if($data['type']==1){
                $jiage=$jiageQuery['huida'];
            }
            if($data['type']==2){
                $jiage=$jiageQuery['huida2'];
            }
            $userQuery = Db::name("user");
            $where = [];
            $where['id'] = $userId;
            $xiaofei = $content_num * $title_num * $jiage * 1;
            $coin = $userQuery->where($where)->find();
            $userQuery->where($where)->update(array('score' => $coin['score'] - $xiaofei));

            //增加明细记录
            $userMoneyQuery = Db::name("user_money_log");
            $data2 = [];
            $data2['user_id'] = $userId;
            $data2['create_time'] = time();
            $data2['type'] = 2;
            $data2['post_title'] = '百度知道【批量】评论任务';
            $data2['score'] = $xiaofei;
            $userMoneyQuery->insert($data2);

            //增加评论
            $post_url=implode('@@',$data['post_url']);
            $userPinglunQuery = Db::name("pinglun_post");
            $pinglun_data = ['post_type' => 1, 'post_title' => "批量评论任务", 'post_content' => '', 'post_url' => $post_url, 'post_content_num' => $content_num, 'user_id' => $userId, 'create_time' => time()];
            $userPinglunQuery->insert($pinglun_data);
            $renwu_id = $userPinglunQuery->getLastInsID();

            //存入内容表
            $time = time();
            $contentQuery = Db::name('pinglun_content_post');
            $renwuQuery = Db::name('zhidaotaskdata');
            $CookieQuery = Db::name('zhidaobaiducook');


            foreach ($content_data as $v) {
                if (strlen($v) > 1) {
                    $content_data = ['post_title' => $v, 'pinglun_id' => $renwu_id, 'create_time' => $time];
                    $contentQuery->insert($content_data);
                    $content_id = $contentQuery->getLastInsID();
                    $renwudata=[];
                    //循环url
                    foreach($data['post_url'] as $key=>$va) {
                        //随机百度cookie
                        $baidu_cookie = $CookieQuery->field('baidu_cookie')->where(['type'=>$data['type'],'cookie_fail' => ['lt', 10], 'delete_time' => 0])->order('rand()')->limit(1)->find();
                        //生成任务列表
                        $renwudata[] = ['user_id'=>$userId,'pinglun_id' => $renwu_id, 'title' => base64_encode($data['post_title'][$key]), 'content_id' => $content_id, 'zhidao' => 'hd', 'get_url' => $va, 'content' => base64_encode($v), 'baidu_cookie' => $baidu_cookie['baidu_cookie'], 'create_time' => $time];
                    }
                    $renwuQuery->insertAll($renwudata);
                }
            }
            return "ok";

        }else{
            return "err:评论内容不能为空";
        }
    }
    public function pinglunzhixing($data){
        $userId               = cmf_get_current_user_id();
        $pinglunQuery=Db::name("pinglun_post");
        $taskQuery=$pinglunQuery->field("id")->where('user_id',$userId)->select();
        $ids='';
        foreach($taskQuery as $v){
            $ids.=','.$v['id'];
        }
        $pinglunTaskQuery            = Db::name("zhidaotaskdata");
        if(isset($data['id'])) {
            $where['pinglun_id'] = $data['id'];
        }else{
            $where['pinglun_id']=['in',$ids];
        }
        $where['delete_time']=0;

        $favorites            = $pinglunTaskQuery->field('zhidao,content,get_url,return_code,return_err,return_img')->where($where)->order('id desc')->paginate(20);

        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function pinglunTiwen()
    {
        $userId               = cmf_get_current_user_id();
        $userPinglunQuery            = Db::name("pinglun_post");

        $where['a.user_id']     = $userId;
        $where['a.post_type']     = 2;
        $where['a.delete_time']     = 0;
        $where['u.delete_time']     = 0;
        $join = [
            ['zhidaotaskdata u', 'a.id = u.pinglun_id']
        ];
        $field = 'a.*,u.return_code,u.return_url,u.return_img';

        $favorites            = $userPinglunQuery->alias('a')->join($join)->field($field)->where($where)->order('id desc')->paginate(10);

        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }

    public function pingluntiwenadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $userPinglunQuery            = Db::name("pinglun_post");

        //内容禁词检测
        $jinciQuery=Db::name('pinglun_jinci_post');
        $jinci = $jinciQuery->field('post_title')->where(['delete_time'=>0])->select();
        if ($jinci) {
            foreach ($jinci as $val) {
                if (strpos($data['post_title'], $val['post_title']) !== false) {
                    return "err:".$val['post_title'];
                }
                if (strpos($data['post_content'], $val['post_title']) !== false) {
                    return "err:".$val['post_title'];
                }
            }
        }


        $post_title=$data['post_title'];
        $post_content=$data['post_content'];
        $type=$data['type'];

        $post_cookie=base64_encode($data['post_cookie']);
        if($type=='1'||$type=='2'){
            //随机百度cookie
            $CookieQuery = Db::name('zhidaobaiducook');
            $baidu_cookie = $CookieQuery->field('baidu_cookie')->where(['type'=>$type,'cookie_fail'=>['lt', 10],'delete_time'=>0])->order('rand()')->limit(1)->find();
            $post_cookie =$baidu_cookie['baidu_cookie'];
        }

        $pinglun_data=['user_id'=>$userId,'cookie_type'=>$type,'post_type'=>2,'post_title'=>$post_title,'post_content'=>base64_encode($post_content),'post_cookie'=>$post_cookie,'create_time'=>time()];


        $userPinglunQuery->insert($pinglun_data);
        $renwu_id=$userPinglunQuery->getLastInsID();


        //生成任务列表
        $renwuQuery=Db::name('zhidaotaskdata');
        $renwudata = ['user_id'=>$userId,'pinglun_id' => $renwu_id, 'zhidao' => 'tw', 'title' => base64_encode($data['post_title']), 'content'=>base64_encode($post_content),'baidu_cookie' => $post_cookie, 'create_time' => time()];
        $renwuQuery->insert($renwudata);


        //积分减少
        $jiage=1;
        $jiageQuery=Db::name('user_jiage')->field('tiwen,tiwen2')->where('id',1)->find();
        if($data['type']==1){
            $jiage=$jiageQuery['tiwen'];
        }
        if($data['type']==2){
            $jiage=$jiageQuery['tiwen2'];
        }
        if($data['type']==3){
            $jiage=$jiageQuery['tiwen'];
        }
        $userQuery            = Db::name("user");
        $where=[];
        $where['id']=$userId;
        $xiaofei=$jiage;
        $coin=$userQuery->where($where)->find();
        $userQuery->where($where)->update(array('score'=>$coin['score']-$xiaofei));

        //增加明细记录
        $userMoneyQuery            = Db::name("user_money_log");
        $data2=[];
        $data2['user_id']=$userId;
        $data2['create_time']=time();
        $data2['type']=2;
        $data2['post_title']='百度知道【'.$data['post_title'].'】提问任务';
        $data2['score']=$xiaofei;
        $userMoneyQuery->insert($data2);

        return 'ok';
    }
    public function mingxi($filter)
    {
        $userId               = cmf_get_current_user_id();
        $userTixianQuery            = Db::name("user_money_log");

        $where['user_id']     = $userId;

        $startTime = empty($filter['start_time']) ? 0 : strtotime($filter['start_time']);
        $endTime   = empty($filter['end_time']) ? 0 : strtotime($filter['end_time']);
        if (!empty($startTime) && !empty($endTime)) {
            $where['create_time'] = [['>= time', $startTime], ['<= time', $endTime]];
        } else {
            if (!empty($startTime)) {
                $where['create_time'] = ['>= time', $startTime];
            }
            if (!empty($endTime)) {
                $where['create_time'] = ['<= time', $endTime];
            }
        }
        $type = empty($filter['type']) ? '' : $filter['type'];
        if ($type) {
            $where['type'] = ['eq', $type];
        }

        $favorites            = $userTixianQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function guanjianciadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $userGuanjianciQuery            = Db::name("guanjianci_post");
        $data['user_id']     = $userId;
        $data['create_time']     = time();
        $userGuanjianciQuery->insert($data);
        $renwu_id=$userGuanjianciQuery->getLastInsID();

        //生成任务列表
        $renwuQuery=Db::name('taskdjdata');

        switch ($data['post_type']){
            case 1:
                $sou="baidu";
                break;
            case 2:
                $sou="sogou";
                break;
            case 3:
                $sou="so";
                break;
        }
        $time=time();
        $cookieQuery=Db::name('baiducookie');
        for($i=0;$i<$data['post_tianshu'];$i++){
            $rq=strtotime(date('Y-m-d' , strtotime('+'.$i.' day')));
            for($t=0;$t<24;$t++) {
                $renwudata=[];
                for ($j = 0; $j < $data['txt_time' . $t]; $j++) {
                    $xs = $t * 3600;
                    //随机百度cookie
                    $baidu_cookie = $cookieQuery->field('baidu_cookie')->where(['cookie_fail'=>['lt', 10],'delete_time'=>0])->order('rand()')->limit(1)->find();
                    $renwudata[] = ['renwu_id' => $renwu_id, 'task_time' => $rq + $xs, 'sou' => base64_encode($sou), 'key' => base64_encode($data['post_title']), 'title' => base64_encode($data['post_biaoti']), 'baidu_cookie' => $baidu_cookie['baidu_cookie'], 'create_time' => $time];
                }
                $renwuQuery->insertAll($renwudata);
            }
        }


        //积分减少
        $jiageQuery=Db::name('user_jiage')->field('guanjianci')->where('id',1)->find();

        $userQuery            = Db::name("user");
        $where=[];
        $where['id']=$userId;
        $xiaofei=$data['post_dianjicishu']*$data['post_tianshu']*$jiageQuery['guanjianci'];
        $coin=$userQuery->where($where)->find();
        $userQuery->where($where)->update(array('score'=>$coin['score']-$xiaofei));

        //增加明细记录
        $userMoneyQuery            = Db::name("user_money_log");
        $data2=[];
        $data2['user_id']=$userId;
        $data2['create_time']=time();
        $data2['type']=2;
        $data2['post_title']='关键词【'.$data['post_title'].'】点击任务';
        $data2['score']=$xiaofei;
        $userMoneyQuery->insert($data2);

        return $userGuanjianciQuery;
    }
    public function zhizhuchi()
    {
        $userId               = cmf_get_current_user_id();
        $userPinglunQuery            = Db::name("zhizhuchi_post");

        $where['user_id']     = $userId;
        $where['delete_time']     = 0;

        $favorites            = $userPinglunQuery->where($where)->order('id desc')->paginate(10);

        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function zhizhuchiadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $time=time();
        $str = str_replace(array("\r\n", "\r", "\n", "\t"), "###", $data['url']);
        $content_data=explode('###',$str);
        $j=0;
        foreach($content_data as $v) {
            $v=trim($v);
            if (strlen($v) > 1) {
                $j++;
            }
        }
        $url_num=$j;

        //积分减少
        $jiageQuery=Db::name('user_jiage')->field('shoulu')->where('id',1)->find();
        $jiage=$jiageQuery['shoulu'];
        $userQuery            = Db::name("user");
        $where=[];
        $where['id']=$userId;
        $xiaofei=$data['post_tianshu']*$url_num*$jiage;
        $coin=$userQuery->where($where)->find();
        $userQuery->where($where)->update(array('score'=>$coin['score']-$xiaofei));

        if($userQuery) {
            //增加明细记录
            $userMoneyQuery = Db::name("user_money_log");
            $data2 = [];
            $data2['user_id'] = $userId;
            $data2['create_time'] = $time;
            $data2['type'] = 2;
            $data2['post_title'] = '蜘蛛池【' . $data['post_title'] . '】任务';
            $data2['score'] = $xiaofei;
            $userMoneyQuery->insert($data2);

            if($userMoneyQuery) {
                $userZhizhuchiQuery = Db::name("zhizhuchi_post");
                $zhizhuchi_data['user_id'] = $userId;
                $zhizhuchi_data['post_title'] = $data['post_title'];
                $zhizhuchi_data['post_tianshu'] = $data['post_tianshu'];
                $zhizhuchi_data['post_url_num'] = $url_num;
                $zhizhuchi_data['create_time'] = $time;
                $userZhizhuchiQuery->insert($zhizhuchi_data);
                $renwu_id = $userZhizhuchiQuery->getLastInsID();

                if($renwu_id) {
                    //插入url表
                    $urlQuery = Db::name('zhizhuchi_url');

                    foreach($content_data as $v){
                        $v=trim($v);
                        if(strlen($v)>1){
                            if(strpos($v, 'http')===false){
                                $v=str_replace('http://','',$v);
                            }
                            $url_data = ['post_title'=>$v,'renwu_id'=>$renwu_id,'create_time'=>$time];
                            $urlQuery->insert($url_data);

                            //todo:提交到蜘蛛池
                        }
                    }
                    return "ok";
                }
                return "添加失败";
            }
            return "明细添加失败";
        }
        return "费用扣除失败";
    }
    public function zhizhuchiurl($data){
        $urlQuery            = Db::name("zhizhuchi_url");

        $favorites            = $urlQuery->field('post_title')->where(['renwu_id'=>$data['id'],'delete_time'=>0])->order('id desc')->paginate(10);

        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function tixianadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $userTixianQuery            = Db::name("tixian_post");
        $data['user_id']     = $userId;
        $data['create_time']     = time();
        $userTixianQuery->insert($data);

        //积分减少
        $userQuery            = Db::name("user");
        $where=[];
        $where['id']=$userId;
        $coin=$userQuery->where($where)->find();
        $userQuery->where($where)->update(array('score'=>$coin['score']-$data['post_jine']*10));

        //增加明细记录
        $userMoneyQuery            = Db::name("user_money_log");
        $data2=[];
        $data2['user_id']=$userId;
        $data2['create_time']=time();
        $data2['type']=3;
        $data2['post_title']='申请提现';
        $data2['jine']=$data['post_jine'];
        $data2['score']=$data['post_jine']*10;
        $userMoneyQuery->insert($data2);

        return $userQuery;
    }
    public function guanjianci()
    {
        $userId               = cmf_get_current_user_id();
        $userFapiaoQuery            = Db::name("guanjianci_post");

        $where['user_id']     = $userId;
        $favorites            = $userFapiaoQuery->where($where)->order('create_time desc')->paginate(10);
        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function fapiao()
    {
        $userId               = cmf_get_current_user_id();
        $userFapiaoQuery            = Db::name("user_fapiao_post");

        $where['user_id']     = $userId;
        $favorites            = $userFapiaoQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();

        $data['lists']        = $favorites->items();
        return $data;
    }
    public function jiangjin()
    {
        $userId               = cmf_get_current_user_id();
        $userMoneyQuery            = Db::name("user_money_log");
        $wh =[];
        $userQuery            = Db::name("user");
        $where['parent_id']     = $userId;
        $favorites            = $userQuery->field("id")->where($where)->whereOr('id',$userId)->select();
        $wh=[];
        //时间区间：今年
        $s=mktime(0,0,0,1,1,date('Y',time()));  //年初
        $e=mktime(23,59,59,12,31,date('Y',time()));   //年末
        $wh['create_time'] = ['between',[$s,$e]];
        $zjine=0;
        foreach($favorites as $ida){
            $wh['user_id'] = ['=',$ida['id']];
            $wh['type'] = ['=',1];

            $wh['create_time'] = ['between',[$s,$e]];
            $jine = $userMoneyQuery->where($wh)->field('sum(jine) as je')->select();
            $zjine+=$jine[0]['je'];
        }
        $zjine2=0;

        $wh=[];
        //时间区间：去年
        $ss=mktime(0,0,0,1,1,date('Y',time())-1);  //年初
        $ee=mktime(23,59,59,12,31,date('Y',time())-1);   //年末
        $wh['create_time'] = ['between',[$ss,$ee]];
        foreach($favorites as $ida){
            $wh['user_id'] = ['=',$ida['id']];
            $wh['type'] = ['=',1];

            $jine = $userMoneyQuery->where($wh)->field('sum(jine) as je')->select();
            $zjine2+=$jine[0]['je'];
        }
        if($zjine>3000000) {
            $jiangjin=$zjine*0.15;
        }elseif($zjine>1000000) {
            $jiangjin=$zjine*0.10;
        }elseif($zjine>500000) {
            $jiangjin=$zjine*0.06;
        }else{
            $jiangjin=0;
        }
        if($zjine2>3000000) {
            $jiangjin2=$zjine2*0.15;
        }elseif($zjine>1000000) {
            $jiangjin2=$zjine2*0.10;
        }elseif($zjine>500000) {
            $jiangjin2=$zjine2*0.06;
        }else{
            $jiangjin2=0;
        }
        $list=[
            ['nian'=>date("Y", strtotime("-1 year")),'zonge'=>$zjine2,'jiangjin'=>$jiangjin2],
            ['nian'=>date("Y", time()),'zonge'=>$zjine,'jiangjin'=>$jiangjin]
        ];

        return $list;
    }

    public function comments()
    {
        $userId               = cmf_get_current_user_id();
        $userQuery            = Db::name("Comment");
        $where['user_id']     = $userId;
        $where['delete_time'] = 0;
        $favorites            = $userQuery->where($where)->order('id desc')->paginate(10);
        $data['page']         = $favorites->render();
        $data['lists']        = $favorites->items();
        return $data;
    }

    public function fapiaoadd($data)
    {
        $userId               = cmf_get_current_user_id();
        $userQuery            = Db::name("user_fapiao_post");
        $data['user_id']     = $userId;
        $data['create_time']     = time();
        $userQuery->insert($data);
        return $userQuery;
    }
    public function deleteTuandui($id)
    {
//        $userId              = cmf_get_current_user_id();
        $userQuery           = Db::name("user");
        $where['id']         = $id;
//        $where['user_id']    = $userId;
        $data['parent_id'] = 0;
        $userQuery->where($where)->update($data);
        return $data;
    }

    public function deleteComment($id)
    {
        $userId              = cmf_get_current_user_id();
        $userQuery           = Db::name("Comment");
        $where['id']         = $id;
        $where['user_id']    = $userId;
        $data['delete_time'] = time();
        $userQuery->where($where)->update($data);
        return $data;
    }

    /**
     * 绑定用户手机号
     */
    public function bindingMobile($user)
    {
        $userId      = cmf_get_current_user_id();
        $mobileCount = $this->where('mobile', $user['mobile'])->count();
        if ($mobileCount > 0) {
            return 2; //手机已经存在
        } else {
            Db::name("user")->where('id', $userId)->update($user);
            $data = Db::name("user")->where('id', $userId)->find();
            cmf_update_current_user($data);
        }

        return 0;
    }

    /**
     * 绑定用户邮箱
     */
    public function bindingEmail($user)
    {
        $userId     = cmf_get_current_user_id();
        $emailCount = $this->where('user_email', $user['user_email'])->count();
        if ($emailCount > 0) {
            return 2; //邮箱已经存在
        } else {
            Db::name("user")->where('id', $userId)->update($user);
            $data = Db::name("user")->where('id', $userId)->find();
            cmf_update_current_user($data);
        }

        return 0;
    }
}
