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

use cmf\controller\AdminBaseController;
use think\Db;

/**
 * Class AdminIndexController
 * @package app\user\controller
 *
 * @adminMenuRoot(
 *     'name'   =>'用户管理',
 *     'action' =>'default',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 10,
 *     'icon'   =>'group',
 *     'remark' =>'用户管理'
 * )
 *
 * @adminMenuRoot(
 *     'name'   =>'用户组',
 *     'action' =>'default1',
 *     'parent' =>'user/AdminIndex/default',
 *     'display'=> true,
 *     'order'  => 10000,
 *     'icon'   =>'',
 *     'remark' =>'用户组'
 * )
 */
class AdminIndexController extends AdminBaseController
{

    /**
     * 后台本站用户列表
     * @adminMenu(
     *     'name'   => '本站用户',
     *     'parent' => 'default1',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $where   = [];
        $request = input('request.');

        if (!empty($request['uid'])) {
            $where['id'] = intval($request['uid']);
        }
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['user_login']    = ['like', "%$keyword%"];
            $keywordComplex['user_nickname'] = ['like', "%$keyword%"];
            $keywordComplex['user_email']    = ['like', "%$keyword%"];
            $keywordComplex['mobile']    = ['like', "%$keyword%"];
        }
        $usersQuery = Db::name('user');
        $userGroupQuery = Db::name('user_group');

        $list = $usersQuery->where($where)->whereOr($keywordComplex)->order("create_time DESC")->paginate(10);
        $data=[];
        foreach($list as $v){
            $usergroupname=$userGroupQuery->field('post_title')->where('id',$v['user_group'])->find();
            $v['user_group_name']=$usergroupname['post_title'];
            $data[]=$v;
        }
        // 获取分页显示
        $page = $list->render();
        $this->assign('list', $data);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    /**
     * 本站用户拉黑
     * @adminMenu(
     *     'name'   => '本站用户拉黑',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户拉黑',
     *     'param'  => ''
     * )
     */
    public function ban()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("user")->where(["id" => $id, "user_type" => 2])->setField('user_status', 0);
            if ($result) {
                $this->success("会员拉黑成功！", url("adminIndex/index"));
            } else {
                $this->error('会员拉黑失败,会员不存在,或者是管理员！');
            }
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function edit(){
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("user")->where(["id" => $id, "user_type" => 2])->find();
            $user_group=Db::name("user_group")->field('id,post_title')->order('id asc')->select();
            $this->assign('user', $result);
            $this->assign('id', $id);
            $this->assign('user_group', $user_group);
            // 渲染模板输出
            return $this->fetch();
        } else {
            $this->error('数据传入失败！');
        }
    }
    public function editPost(){
        $data = $this->request->param();
        $user_id=$data['id'];
        $userQuery = Db::name('user');
        $result=$userQuery->where(["id" => $user_id])->update(["gongsimingcheng" => $data['gongsimingcheng'],"yingyezhizhaohaoma"=>$data['yingyezhizhaohaoma'],"yingyezhizhao"=>$data['yingyezhizhao'],"faren"=>$data['faren'],"lianxidianhua"=>$data['lianxidianhua'],"dianziyouxiang"=>$data['dianziyouxiang'],"dizhi"=>$data['dizhi'],"wangzhi"=>$data['wangzhi'],"lianxiren"=>$data['lianxiren'],"xingbie"=>$data['xingbie'],"gangwei"=>$data['gangwei'],"dianhua"=>$data['dianhua'],"qq"=>$data['qq'],"youxiang"=>$data['youxiang'],"score"=>$data['score'],"user_group"=>$data['user_group'],"user_status"=>1]);
        $this->success("更新成功！");
    }

    public function chongzhi(){
        $id = input('param.id', 0, 'intval');
        if ($id) {
            $result = Db::name("user")->where(["id" => $id, "user_type" => 2])->find();
            $this->assign('user_name', $result['user_nickname']?$result['user_nickname']:$result['mobile']);
            $this->assign('score', $result['score']);
            $this->assign('id', $id);
            // 渲染模板输出
            return $this->fetch();
        } else {
            $this->error('数据传入失败！');
        }
    }

    public function chongzhiPost()
    {
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
        $type='后台充值';
//        switch ($data['type']){
//            case 'zfb':
//                $type='支付宝';
//                $pay_url='http://www.alipay.com';
//                break;
//            case 'wx':
//                $type='微信';
//                $pay_url='http://www.weixin.com';
//                break;
//            case 'yhk':
//                $type='银行卡';
//                $pay_url='http://www.pay.com';
//                break;
//        }
        $user_id=$data['id'];

        $pay_result='ok';  //支付接口返回结果

        $userQuery = Db::name('user');
        $userMoneyQuery=Db::name('user_money_log');
        $userGroupQuery=Db::name('user_group');

        if($pay_result=='ok') {
            //获取会员级别条件
            $userGroup=$userGroupQuery->field('id,post_jine')->order('post_jine desc')->select();

            //会员级别调整
            $coin=$userQuery->field('coin,parent_id,user_nickname')->where('id',$user_id)->find();
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
            $parent_id=$coin['parent_id'];
            if($parent_id>0) {
                $parent_group=$userQuery->field('user_group')->where('id', $parent_id)->find();
                $fenchengbili=$userGroupQuery->field('fenchengbili')->where('id', $parent_group['user_group'])->find();
                $fandian=$fenchengbili['fenchengbili'];
                $userQuery->where('id',$parent_id)->setInc('score',$jifen*$fandian);
                //明细增加,赠送为4
                $moneyData2=['user_id'=>$parent_id,'create_time'=>time(),'type'=>4,'post_title'=>'团队成员【'.$coin['user_nickname'].'】充值赠送米币','score'=>$jifen*$fandian];
                $userMoneyQuery->insert($moneyData2);
            }


            if($userqueryresult&&$usermoneyqueryresult&&$userqueryresult2) {
                $this->success("充值成功！", '');
            }
        }
    }

    /**
     * 本站用户启用
     * @adminMenu(
     *     'name'   => '本站用户启用',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '本站用户启用',
     *     'param'  => ''
     * )
     */
    public function cancelBan()
    {
        $id = input('param.id', 0, 'intval');
        if ($id) {
            Db::name("user")->where(["id" => $id, "user_type" => 2])->setField('user_status', 1);
            $this->success("会员启用成功！", '');
        } else {
            $this->error('数据传入失败！');
        }
    }
}
