<?php
namespace app\host\controller;

use cmf\controller\AdminBaseController;

use app\host\model\HostModel;
use app\host\service\PostService;

use think\Db;
use app\admin\model\ThemeModel;

/**
 * Class AdminIndexController
 * @package app\baiduzhanghao\controller
 * @adminMenuRoot(
 *     'name'   =>'百度帐号管理',
 *     'action' =>'index',
 *     'parent' =>'',
 *     'display'=> true,
 *     'order'  => 30,
 *     'icon'   =>'user',
 *     'remark' =>'百度帐号管理'
 * )
 */
class AdminIndexController extends AdminBaseController
{
    public function index()
    {
        $param = $this->request->param();

        $postService = new PostService();
        $data        = $postService->adminArticleList($param);

        $data->appends($param);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('keyword', isset($param['keyword']) ? $param['keyword'] : '');
        $this->assign('articles', $data->items());


        return $this->fetch();
    }
    /**
     * 添加文章
     * @adminMenu(
     *     'name'   => '添加文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章',
     *     'param'  => ''
     * )
     */
    public function add()
    {
//        $themeModel        = new ThemeModel();
//        $articleThemeFiles = $themeModel->getActionThemeFiles('chongzhixiaofei/Index/index');
//        $this->assign('index_theme_files', $articleThemeFiles);
        return $this->fetch();
    }
    /**
     * 添加文章提交
     * @adminMenu(
     *     'name'   => '添加文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加文章提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();
//            $post   = $data['post'];
//            $result = $this->validate($post, 'AdminArticle');
//            if ($result !== true) {
//                $this->error($result);
//            }

            $portalPostModel = new HostModel();


            $portalPostModel->adminAddIndex($data['post']);



            $this->success('添加成功!', url('AdminIndex/index'));
        }

    }
    /**
     * 编辑文章
     * @adminMenu(
     *     'name'   => '编辑文章',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章',
     *     'param'  => ''
     * )
     */
    public function edit()
    {
        $id = $this->request->param('id', 0, 'intval');

        $portalPostModel = new HostModel();
        $post            = $portalPostModel->where('id', $id)->find();
//        $postCategories  = $post->categories()->alias('a')->column('a.name', 'a.id');
//        $postCategoryIds = implode(',', array_keys($postCategories));
//
//        $themeModel        = new ThemeModel();
//        $articleThemeFiles = $themeModel->getActionThemeFiles('portal/Article/index');
//        $this->assign('article_theme_files', $articleThemeFiles);
        $this->assign('post', $post);
//        $this->assign('post_categories', $postCategories);
//        $this->assign('post_category_ids', $postCategoryIds);

        return $this->fetch();
    }
    /**
     * 编辑文章提交
     * @adminMenu(
     *     'name'   => '编辑文章提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '编辑文章提交',
     *     'param'  => ''
     * )
     */
    public function editPost()
    {

        if ($this->request->isPost()) {
            $data   = $this->request->param();
//            $post   = $data['post'];
//            $result = $this->validate($post, 'AdminArticle');
//            if ($result !== true) {
//                $this->error($result);
//            }

            $portalPostModel = new HostModel();


            $portalPostModel->adminEditArticle($data['post']);

            $this->success('保存成功!', url('AdminIndex/index'));

        }
    }

    /**
     * 文章删除
     * @adminMenu(
     *     'name'   => '文章删除',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文章删除',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $param           = $this->request->param();
        $portalPostModel = new HostModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'host',
                'name'        => $result['client_ip']
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
                        'table_name'  => 'host',
                        'name'        => $value['client_ip']
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }
}

