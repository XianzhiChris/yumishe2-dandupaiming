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
class AdminGroupController extends AdminBaseController
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
        $where   = [];

        $usersQuery = Db::name('user_group');

        $list = $usersQuery->where('delete_time',0)->order("id DESC")->paginate(10);

        // 获取分页显示
        $page = $list->render();

        $this->assign('list', $list->items());
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }

    public function add()
    {

        return $this->fetch();
    }
    public function addPost()
    {
        if ($this->request->isPost()) {
            $param   = $this->request->param();

            $data=['post_title'=>$param['post_title'],'post_jine'=>$param['post_jine'],'fenchengbili'=>$param['fenchengbili'],'remark'=>$param['remark'],'create_time'=>time()];
            Db::name('user_group')->insert($data);

            $this->success('添加成功!', url('AdminGroup/index'));
        }

    }

    public function edit()
    {
        $id     = $this->request->param('id', 0, 'intval');
        $action = Db::name('user_group')->where('id', $id)->find();
        $this->assign('post', $action);

        return $this->fetch();
    }

    public function editPost()
    {
        $id = $this->request->param('id', 0, 'intval');

        $data = $this->request->param();

        Db::name('user_group')->where('id', $id)->update($data);

        $this->success('保存成功！',url('AdminGroup/index'));
    }
    public function delete()
    {
        $param           = $this->request->param();
        $portalPostModel = Db::name('user_group');

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'user_group',
                'name'        => $result['post_title']
            ];
            $resultPortal = $portalPostModel
                ->where(['id' => $id])
                ->update(['delete_time' => time()]);
            if ($resultPortal) {
                Db::name('recycleBin')->insert($data);
            }
            $this->success("删除成功！", '');

        }

        if (isset($param['ids'])) {
            $ids     = $this->request->param('ids/a');
            $recycle = $portalPostModel->where(['id' => ['in', $ids]])->select();
            $result  = $portalPostModel->where(['id' => ['in', $ids]])->update(['delete_time' => time()]);
            if ($result) {
                foreach ($recycle as $value) {
                    $data = [
                        'object_id'   => $value['id'],
                        'create_time' => time(),
                        'table_name'  => 'user_group',
                        'name'        => $value['post_title']
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }
}
