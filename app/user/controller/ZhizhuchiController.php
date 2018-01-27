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
namespace app\user\controller;

use cmf\controller\UserBaseController;
use app\user\model\UserModel;
use think\Db;
use think\Model;

class ZhizhuchiController extends UserBaseController
{
    function _initialize()
    {
        parent::_initialize();
    }
    /**
     * 个人中心蜘蛛池管理
     */
    public function index()
    {
        $editData = new UserModel();
        $data = $editData->zhizhuchi();
        $user = cmf_get_current_user();

        $this->assign($user);
        $userQuery=Db::name('user');
        $coin=$userQuery->field('score')->where(array('id'=>$user['id']))->find();
        $this->assign('myscore',$coin['score']);
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        $jiageQuery=Db::name('user_jiage')->field('shoulu')->where('id',1)->find();
        $this->assign("jiage", $jiageQuery['shoulu']);
        return $this->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {

        $user = cmf_get_current_user();
        $this->assign($user);
        $userQuery=Db::name('user');
        $coin=$userQuery->field('score')->where(array('id'=>$user['id']))->find();
        $this->assign('myscore',$coin['score']);
        $jiageQuery=Db::name('user_jiage')->field('shoulu')->where('id',1)->find();
        $this->assign("jiage", $jiageQuery['shoulu']);
        return $this->fetch();
    }

    public function addPost()
    {
        $data = $this->request->param();
        $editData = new UserModel();
        $res=$editData->zhizhuchiadd($data);
        if($res=="ok"){
            $this->success('添加成功！', url('user/zhizhuchi/index'));
        }else{
            $this->error($res);
        }
    }

    public function url()
    {
        $user = cmf_get_current_user();
        $this->assign($user);
        $data = $this->request->param();
        //当前任务名称
        $PinglunQuery            = Db::name("zhizhuchi_post");
        $title=$PinglunQuery->field('post_title')->where('id',$data['id'])->find();
        $this->assign('title',$title['post_title']);

        $editData = new UserModel();
        $data = $editData->zhizhuchiurl($data);
        $user = cmf_get_current_user();
        $this->assign($user);
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        return $this->fetch();
    }

    //续费
    public function xufei(){
        $userId               = cmf_get_current_user_id();
        $data = $this->request->param();
        $renwu_id=$data['id'];
        $time=time();

        //获取任务信息
        $userZhizhuchiQuery            = Db::name("zhizhuchi_post");
        $zhizhuchi_post=$userZhizhuchiQuery->field("post_title,post_tianshu,post_url_num")->where('id',$renwu_id)->find();

        //积分减少
        $userQuery            = Db::name("user");
        $where=[];
        $where['id']=$userId;
        $xiaofei=$zhizhuchi_post['post_tianshu']*$zhizhuchi_post['post_url_num']*1;
        $coin=$userQuery->where($where)->find();
        $userQuery->where($where)->update(array('score'=>$coin['score']-$xiaofei));

        if($userQuery) {
            //增加明细记录
            $userMoneyQuery = Db::name("user_money_log");
            $data2 = [];
            $data2['user_id'] = $userId;
            $data2['create_time'] = $time;
            $data2['type'] = 2;
            $data2['post_title'] = '蜘蛛池【' . $data['post_title'] . '】任务续费';
            $data2['score'] = $xiaofei;
            $userMoneyQuery->insert($data2);

            if($userMoneyQuery) {
                //更新任务时间
                $userZhizhuchiQuery->where('id',$renwu_id)->update(['create_time'=>$time]);

                //获取url
                $urlQuery = Db::name('zhizhuchi_url');
                $content_data=$urlQuery->field('post_title')->where('renwu_id',$renwu_id)->select();

                foreach($content_data as $v){
                    $url = $v['post_title'];

                    //todo:提交到蜘蛛池
                }
                $this->success('续费成功！', url('user/zhizhuchi/index'));

            }
            $this->error('明细添加失败！', url('user/zhizhuchi/index'));
        }
        $this->error('费用扣除失败！', url('user/zhizhuchi/index'));
    }

}