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
 * Class AdminUserActionController
 * @package app\user\controller
 */
class AdminFapiaoController extends AdminBaseController
{

    /**
     * 用户操作管理
     * @adminMenu(
     *     'name'   => '用户操作管理',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '用户操作管理',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $where['delete_time']   = 0;
        $wh=[];
        $request = input('request.');

        $usersQuery = Db::name('user');
        $usersFapiaoQuery = Db::name('user_fapiao_post');

        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $where['user_login']    = ['like', "%$keyword%"];
            $where['user_nickname'] = ['like', "%$keyword%"];
            $where['user_email']    = ['like', "%$keyword%"];
        }

        $list = $usersFapiaoQuery->where($where)->order("create_time DESC")->paginate(10);
        $aa=[];
        foreach($list as $k=>$pid){

            $wh['id'] = $pid['user_id'];
            $user_nickname = $usersQuery->where($wh)->field('user_nickname')->select();

            $pid['user_nickname']=$user_nickname[0]['user_nickname'];
            $pid['zt']=$pid['status']?"已寄出":"未寄出";
            $aa[]=$pid;

        }

        // 获取分页显示
        $page = $list->render();

        $this->assign('list', $aa);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    public function edit()
    {
        $id     = $this->request->param('id', 0, 'intval');
        $action = Db::name('user_fapiao_post')->where('id', $id)->find();
        $user_nickname=Db::name('user')->where('id',$action['user_id'])->find();

        $this->assign('user_nickname',$user_nickname);
        $this->assign('post',$action);

        return $this->fetch();
    }

    public function editPost()
    {
        $id = $this->request->param('id', 0, 'intval');

        $data = $this->request->param();
        $data['update_time']=time();
        Db::name('user_fapiao_post')->where('id', $id)
            ->strict(false)
            ->update($data);

        $this->success('保存成功！', url('AdminFapiao/index'));
    }
    public function delete()
    {
        $id = $this->request->param('id', 0, 'intval');
        $usersFapiaoQuery = Db::name('user_fapiao_post');
        $where['id']=$id;
        $usersFapiaoQuery->where(['id' => $id])
            ->update(['delete_time' => time()]);
        $this->success("删除成功！", '');
    }

}
