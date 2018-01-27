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

class FapiaoController extends UserBaseController
{
    function _initialize()
    {
        parent::_initialize();
    }
    /**
     * 个人中心发票管理
     */
    public function index()
    {
        $editData = new UserModel();
        $data = $editData->fapiao();
        $user = cmf_get_current_user();
        $this->assign($user);
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        return $this->fetch();
    }

    /**
     * 添加发票
     */
    public function add()
    {
        $user = cmf_get_current_user();
        $userMoneyQuery=Db::name('user_money_log');
        $zxf=$userMoneyQuery->field('sum(jine) as je')->where(array('user_id'=>$user['id'],'type'=>1))->find();
        $userFapiaoQuery=Db::name('user_fapiao_post');
        $yikaijine=$userFapiaoQuery->field('sum(jine) as je')->where(array('user_id'=>$user['id']))->find();

        $this->assign('kekaijine',$zxf['je']-$yikaijine['je']);
        $this->assign($user);
        return $this->fetch();
    }

    public function addPost()
    {
        $data = $this->request->param();
        $editData = new UserModel();
        $editData->fapiaoadd($data);

        $this->success('添加成功！', url('user/fapiao/index'));
    }
}