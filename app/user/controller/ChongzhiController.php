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

class ChongzhiController extends UserBaseController
{
    function _initialize()
    {
        parent::_initialize();
    }
    /**
     * 个人中心账户充值
     */
    public function index()
    {
        $user = cmf_get_current_user();
        $this->assign($user);
        $user_id = cmf_get_current_user_id();
        $this->assign('user_id',$user_id);
        $userQuery=Db::name('user');
        $coin=$userQuery->field('score')->where(array('id'=>$user_id))->find();
        $this->assign('score',$coin['score']);

        return $this->fetch();
    }
    /**
     * 进行积分充值
     */
    public function chongzhi()
    {
        $user_id = cmf_get_current_user_id();
        $user = cmf_get_current_user();
        $data = $this->request->param();
        switch ($data['jifen']){
            case 1:
                $jifen=1000;
                $jine=1000;
                break;
            case 2:
                $jifen=2000;
                $jine=1960;
                break;
            case 3:
                $jifen=5000;
                $jine=4750;
                break;
            case 4:
                $jifen=10000;
                $jine=8800;
                break;
//            case 5:
//                $jifen=70000;
//                $jine=5000;
//                break;
//            case 6:
//                $jifen=160000;
//                $jine=10000;
//                break;
        }

        switch ($data['type']){
            case 'zfb':
                $type='支付宝';
                $pay_url='http://www.alipay.com';
                break;
            case 'wx':
                $type='微信';
                $pay_url='http://www.weixin.com';
                break;
            case 'yhk':
                $type='银行卡';
                $pay_url='http://www.pay.com';
                break;
        }

        //todo:跳转到支付接口
        $pay_result='ok';  //支付接口返回结果

        $userQuery = Db::name('user');
        $userMoneyQuery=Db::name('user_money_log');
        $userGroupQuery=Db::name('user_group');

        if($pay_result=='ok') {
            //获取会员级别条件
            $userGroup=$userGroupQuery->field('id,post_jine')->order('post_jine desc')->select();

            //会员级别调整
            $coin=$userQuery->field('coin')->where('id',$user_id)->find();
            $zje=$coin['coin']+$jine;
//            $user_group=1;
//            if($zje>50000){
//                $user_group=4;
//            }elseif($zje>20000){
//                $user_group=3;
//            }elseif($zje>5000){
//                $user_group=2;
//            }
            foreach($userGroup as $v){
                if($zje>$v['post_jine']){
                    $user_group=$v['id'];
                    break;
                }
            }


            $userQuery->where('id',$user_id)->update(['user_group'=>$user_group]);
            //会员积分和金额调整
            $userqueryresult=$userQuery->where('id',$user_id)->setInc('score',$jifen);
            $userqueryresult2=$userQuery->where('id',$user_id)->setInc('coin',$jine);
            //明细增加
            $moneyData=['user_id'=>$user_id,'create_time'=>time(),'type'=>1,'post_title'=>'充值【'.$jifen.'】米币','score'=>$jifen,'jine'=>$jine,'remark'=>$type];
            $usermoneyqueryresult=$userMoneyQuery->insert($moneyData);
            //给上级会员返点---返积分
            $parent_id=$user['parent_id'];
            if(isset($parent_id)) {
                $parent_group=$userQuery->field('user_group')->where('id', $parent_id)->find();
                $fenchengbili=$userGroupQuery->field('fenchengbili')->where('id', $parent_group['user_group'])->find();
//                switch ($parent_group['user_group']){
//                    case 1:
//                        $fandian=0.03;
//                        break;
//                    case 2:
//                        $fandian=0.06;
//                        break;
//                    case 3:
//                        $fandian=0.09;
//                        break;
//                    case 4:
//                        $fandian=0.12;
//                        break;
//                }
                $fandian=$fenchengbili['fenchengbili'];
                $userQuery->where('id',$parent_id)->setInc('score',$jifen*$fandian);
                //明细增加,赠送为4
                $moneyData2=['user_id'=>$parent_id,'create_time'=>time(),'type'=>4,'post_title'=>'团队成员【'.$user['user_nickname'].'】充值赠送米币','score'=>$jifen*$fandian];
                $userMoneyQuery->insert($moneyData2);
            }


            if($userqueryresult&&$usermoneyqueryresult&&$userqueryresult2) {
                return 'ok';
            }
        }
    }

}