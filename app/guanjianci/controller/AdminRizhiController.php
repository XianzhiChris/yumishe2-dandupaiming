<?php
namespace app\guanjianci\controller;

use cmf\controller\AdminBaseController;

use app\guanjianci\model\TaskdjdataModel;
use app\guanjianci\service\PostService;

use think\Db;
use app\admin\model\ThemeModel;

/**
 * Class AdminIndexController
 * @package app\pinglun\controller
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
class AdminRizhiController extends AdminBaseController
{
    public function index()
    {
        $param = $this->request->param();

        $postService = new PostService();
        $data        = $postService->adminRizhiList($param);

        $data->appends($param);

        $this->assign('start_time', isset($param['start_time']) ? $param['start_time'] : '');
        $this->assign('end_time', isset($param['end_time']) ? $param['end_time'] : '');
        $this->assign('status', isset($param['status']) ? $param['status'] : 1);

        $this->assign('articles', $data->items());
        $this->assign('page', $data->render());

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

            $portalPostModel = new GuanjianciPostModel();


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

        $portalPostModel = new GuanjianciPostModel();
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

            $portalPostModel = new GuanjianciPostModel();

//            if (!empty($data['photo_names']) && !empty($data['photo_urls'])) {
//                $data['post']['more']['photos'] = [];
//                foreach ($data['photo_urls'] as $key => $url) {
//                    $photoUrl = cmf_asset_relative_url($url);
//                    array_push($data['post']['more']['photos'], ["url" => $photoUrl, "name" => $data['photo_names'][$key]]);
//                }
//            }
//
//            if (!empty($data['file_names']) && !empty($data['file_urls'])) {
//                $data['post']['more']['files'] = [];
//                foreach ($data['file_urls'] as $key => $url) {
//                    $fileUrl = cmf_asset_relative_url($url);
//                    array_push($data['post']['more']['files'], ["url" => $fileUrl, "name" => $data['file_names'][$key]]);
//                }
//            }

//            $portalPostModel->adminEditArticle($data['post'], $data['post']['categories']);
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
        $portalPostModel = new GuanjianciPostModel();

        if (isset($param['id'])) {
            $id           = $this->request->param('id', 0, 'intval');
            $result       = $portalPostModel->where(['id' => $id])->find();
            $data         = [
                'object_id'   => $result['id'],
                'create_time' => time(),
                'table_name'  => 'pinglun_post',
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
                        'table_name'  => 'pinglun_post',
                        'name'        => $value['post_title']
                    ];
                    Db::name('recycleBin')->insert($data);
                }
                $this->success("删除成功！", '');
            }
        }
    }

    public function select()
    {
        $param           = $this->request->param();
        $pinglun_id           = $this->request->param('id', 0, 'intval');
//        $ids                 = $this->request->param('ids');
//        $selectedIds         = explode(',', $ids);
        $portalCategoryModel = new GuanjianciXiangguanciPostModel();

        $tpl = <<<tpl
<tr class='data-item-tr'>
    <td>
        <input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]'
               value='\$id' data-name='\$name' \$checked>
    </td>
    <td>\$id</td>
    <td>\$spacer <a href='\$url' target='_blank'>\$name</a></td>
</tr>
tpl;

//        $categoryTree = $portalCategoryModel->adminCategoryTableTree($pinlun_id, $tpl);

        $where['guanjianci_id']    = ['eq', $pinglun_id];
        $categories = $portalCategoryModel->where($where)->select();
//
        $this->assign('categories', $categories);
        $this->assign('guanjianci_id', $pinglun_id);
//        $this->assign('selectedIds', $selectedIds);
//        $this->assign('categories_tree', $categoryTree);
        return $this->fetch();
    }

    public function xgc_delete()
    {
        $ids                 = $this->request->param('ids/a');
        $portalCategoryModel = new GuanjianciXiangguanciPostModel();
        $result  = $portalCategoryModel->where(['id' => ['in', $ids]])->update(['status' => 1]);
        if ($result) {
            $this->success("审核成功！", '');
        }
    }
    public function xgc_add()
    {
        if ($this->request->isPost()) {
            $data   = $this->request->param();


            $portalPostModel = new GuanjianciXiangguanciPostModel();


            $portalPostModel->adminAddIndex($data['post']);



            $this->success('添加成功!');
        }

    }
}

