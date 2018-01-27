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

class TixianController extends UserBaseController
{
    /**
     * 个人中心提现管理
     */
    public function index()
    {
        $editData = new UserModel();
        $data = $editData->tixian();
        $user = cmf_get_current_user();
        $this->assign($user);
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        return $this->fetch();
    }

    /**
     * 添加提现
     */
    public function add()
    {
        $user = cmf_get_current_user();
        $tixian_score=0;
        $tixian=0;
        $this->assign($user);
        $userQuery=Db::name('user');
        $score=$userQuery->field('score')->where(array('id'=>$user['id']))->find();
        //$score['score']   剩余积分
        $userMoneyQuery=Db::name('user_money_log');
        $zscore=$userMoneyQuery->field(['sum(score)'=>'score'])->where(array('user_id'=>$user['id'],'type'=>4))->find();
        $tscore=$userMoneyQuery->field(['sum(score)'=>'score'])->where(array('user_id'=>$user['id'],'type'=>3))->find();
        //$zscore['score']  赠送积分
        //$tscore['score']  提现积分
        $ketixian=$zscore['score']-$tscore['score'];
        //如果赠送积分大于剩余积分
        if($ketixian>=$score['score']){
            $tixian_score=$score['score'];
        }
        //如果赠送积分小于剩余积分
        if($ketixian<$score['score']){
            $tixian_score=$ketixian;
        }
        if($tixian_score>=1000){
            $tixian=$tixian_score / 10;
        }

        $this->assign('tixian',$tixian);
        return $this->fetch();
    }

    public function addPost()
    {
        $data = $this->request->param();
        $tixian_score=0;
        $tixian=0;
        $user = cmf_get_current_user();
//        $this->assign($user);
        if(intval($data['post_jine'])==0){
            $this->error('添加失败，提现金额不能为0！', url('user/tixian/index'));
        }
        $userQuery=Db::name('user');
        $score=$userQuery->field('score')->where(array('id'=>$user['id']))->find();
        //$score['score']   剩余积分
        $userMoneyQuery=Db::name('user_money_log');
        $zscore=$userMoneyQuery->field(['sum(score)'=>'score'])->where(array('user_id'=>$user['id'],'type'=>4))->find();
        $tscore=$userMoneyQuery->field(['sum(score)'=>'score'])->where(array('user_id'=>$user['id'],'type'=>3))->find();
        //$zscore['score']  赠送积分
        //$tscore['score']  提现积分
        $ketixian=$zscore['score']-$tscore['score'];
        //如果赠送积分大于剩余积分
        if($ketixian>=$score['score']){
            $tixian_score=$score['score'];
        }
        //如果赠送积分小于剩余积分
        if($ketixian<$score['score']){
            $tixian_score=$ketixian;
        }
        if($tixian_score>=1000){
            $tixian=$tixian_score / 10;
        }
        if($data['post_jine']>$tixian){
            $this->error('添加失败，提现金额错误！', url('user/tixian/index'));
        }
        //判断提现次数
        $yuetime=mktime(0,0,0,date('m'),1,date('Y'));//本月0点时间戳
        $cishu=$userMoneyQuery->field(['count(*)'=>'count'])->where(array('user_id'=>$user['id'],'type'=>3,'create_time'=>['>',$yuetime]))->find();
        if($cishu['count']>=2){
            $this->error('添加失败，已超过本月提现次数，请下个月进行提现！', url('user/tixian/index'));
        }

        $editData = new UserModel();
        $editData->tixianadd($data);

        $this->success('添加成功！', url('user/tixian/index'));
    }
}