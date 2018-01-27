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
class AdminMoneyController extends AdminBaseController
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
        $wh=[];
        $aa=[];
        $request = input('request.');
        $param = $this->request->param();

        if (!empty($param['user_id'])) {
            $where['user_id'] = intval($param['user_id']);
        }
        if (!empty($param['type'])) {
            $where['type'] = $param['type'];
        }
        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['post_title']    = ['like', "%$keyword%"];
        }
        $usersMoneyQuery = Db::name('user_money_log');
        $usersQuery = Db::name('user');

        $list = $usersMoneyQuery->where($where)->whereOr($keywordComplex)->order("create_time DESC,id desc")->paginate(10);
        foreach($list as $v){
            $wh['id']=['=',$v['user_id']];
            $nickname=$usersQuery->where($wh)->field('user_nickname')->find();
            $v['user_nickname']=$nickname['user_nickname'];
            $aa[]=$v;
        }
        // 获取分页显示
        $page = $list->render();
        $this->assign('type', isset($param['post_type']) ? $param['post_type'] : '');
        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('articles', $aa);
        $this->assign('page', $page);
        // 渲染模板输出
        return $this->fetch();
    }
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');

        $portalPostModel = Db::name('user_money_log');
        $post            = $portalPostModel->where('id', $id)->find();

        $this->assign('post', $post);

        return $this->fetch();
    }
    public function delete()
    {
        $param           = $this->request->param();
        $portalPostModel = Db::name('user_money_log');

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'user_money_log',
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
                        'table_name'  => 'user_money_log',
                        'name'        => $value['post_title']
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }
}
