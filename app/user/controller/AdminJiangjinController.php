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
class AdminJiangjinController extends AdminBaseController
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
        $wh =[];
        $request = input('request.');


        $keywordComplex = [];
        if (!empty($request['keyword'])) {
            $keyword = $request['keyword'];

            $keywordComplex['user_login']    = ['like', "%$keyword%"];
            $keywordComplex['user_nickname'] = ['like', "%$keyword%"];
            $keywordComplex['user_email']    = ['like', "%$keyword%"];
        }
        $usersQuery = Db::name('user');
        $users_moneyQuery = Db::name('user_money_log');

        $list = $usersQuery->where('is_duizhang',1)->whereOr($keywordComplex)->order("create_time DESC")->paginate(10);
        $aa=[];
        foreach($list as $k=>$pid){

            $where['parent_id'] = ['=',$pid['id']];
            $tdid = $usersQuery->where($where)->whereOr('id',$pid['id'])->field('id')->select();
            $wh=[];
            $zjine=0;
            //时间区间：今年
            $s=mktime(0,0,0,1,1,date('Y',time()));  //年初
            $e=mktime(23,59,59,12,31,date('Y',time()));   //年末
            $wh['create_time'] = ['between',[$s,$e]];
            foreach($tdid as $ida){
                $wh['user_id'] = ['=',$ida['id']];
                $wh['type'] = ['=',1];

                $jine = $users_moneyQuery->where($wh)->field('sum(jine) as je')->select();
                $zjine+=$jine[0]['je'];
            }

            $wh=[];
            $zjine2=0;
            //时间区间：去年
            $ss=mktime(0,0,0,1,1,date('Y',time())-1);  //年初
            $ee=mktime(23,59,59,12,31,date('Y',time())-1);   //年末
            $wh['create_time'] = ['between',[$ss,$ee]];
            foreach($tdid as $ida){
                $wh['user_id'] = ['=',$ida['id']];
                $wh['type'] = ['=',1];

                $jine = $users_moneyQuery->where($wh)->field('sum(jine) as je')->select();
                $zjine2+=$jine[0]['je'];
            }
//            $list[0]['tuandui_jine']=$zjine;
            $pid['tuandui_jine']=$zjine;
            $pid['tuandui_jine2']=$zjine2;
            $pid['tuandui_renshu']=count($tdid);
            if($zjine>3000000) {
                $pid['tuandui_jiangjin']=$zjine*0.15;
            }elseif($zjine>1000000) {
                $pid['tuandui_jiangjin']=$zjine*0.10;
            }elseif($zjine>500000) {
                $pid['tuandui_jiangjin']=$zjine*0.06;
            }else{
                $pid['tuandui_jiangjin']=0;
            }
            if($zjine2>3000000) {
                $pid['tuandui_jiangjin2']=$zjine2*0.15;
            }elseif($zjine2>1000000) {
                $pid['tuandui_jiangjin2']=$zjine2*0.10;
            }elseif($zjine2>500000) {
                $pid['tuandui_jiangjin2']=$zjine2*0.06;
            }else{
                $pid['tuandui_jiangjin2']=0;
            }
            $aa[]=$pid;
//            var_dump($pid);
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
        $action = Db::name('user_action')->where('id', $id)->find();
        $this->assign($action);

        return $this->fetch();
    }

    public function editPost()
    {
        $id = $this->request->param('id', 0, 'intval');

        $data = $this->request->param();

        Db::name('user_action')->where('id', $id)
            ->strict(false)
            ->field('score,coin,reward_number,cycle_type,cycle_time')
            ->update($data);

        $this->success('保存成功！');
    }

}
