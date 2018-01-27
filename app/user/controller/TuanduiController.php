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


class TuanduiController extends UserBaseController
{
    /**
     * 个人中心我的团队列表
     */
    public function index()
    {
        $editData = new UserModel();
        $data = $editData->tuandui();
        $user = cmf_get_current_user();
        $userId               = cmf_get_current_user_id();
        $this->assign($user);
        $this->assign("user_id", $userId);
        $this->assign("page", $data['page']);
        $this->assign("lists", $data['lists']);
        return $this->fetch();
    }
    /**
     * 用户删除评论
     */
    public function delete()
    {
        $id   = $this->request->param("id", 0, "intval");
        $delete = new UserModel();
        $data = $delete->deleteTuandui($id);
        if ($data) {
            $this->success("队员踢出成功！");
        } else {
            $this->error("队员踢出失败！");
        }
    }

    public function jiangjin()
    {
        $editData = new UserModel();
        $data = $editData->jiangjin();
        $user = cmf_get_current_user();

        $this->assign($user);
        $this->assign("lists", $data);
        return $this->fetch();
    }
}