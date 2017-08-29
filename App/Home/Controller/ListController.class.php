<?php
/**
 * @Author: David <espblood@qq.com>
 * @Date:   2017-04-20 10:12
 * @Last Modified by:   David
 * @Last Modified time: 2017-04-20 10:12
 * @Description 添加相关注释
 */
namespace Home\Controller;

use Common\Lib\Category;

/**
 * 栏目控制器
 */
class ListController extends HomeCommonController
{
    /**
     * 根据传入的cid跳转到具体栏目的首页
     */
    public function index()
    {

        $cid = I('cid', 0, 'intval');
        $ename = I('e', '', 'htmlspecialchars,trim');

        $cate = get_category(1);
		

        if (!empty($ename)) { //ename不为空
            $self = Category::getSelfByEName($cate, $ename); //当前栏目信息
        } else {
        //$cid来判断
            $self = Category::getSelf($cate, $cid); //当前栏目信息
        }
		

        if (empty($self)) {
            $this->error('栏目不存在');
        }

        $cid = $self['id']; //当使用ename获取的时候，就要重新给$cid赋值，不然0
        $_GET['cid'] = $cid; //栏目ID
        $self['url'] = get_url($self);

        //访问权限
        $groupid = intval(get_cookie('groupid'));
        $groupid = (empty($groupid) || empty($this->uid))? 1 : $groupid; //1为游客
        //判断访问权限
        $access = M('categoryAccess')->where(array('catid' => $cid, 'flag' => 0, 'action' => 'visit'))->getField('roleid', true);
        //权限存在，则判断
        if (!empty($access) && !in_array($groupid, $access)) {
            $this->error('您没有访问该信息的权限！');
        }

		/*获取产品的具体信息*/
//        $temp_pro = M('product')->where(array('status' => 0, 'cid' => $cid))->order('id')->select();  //旧的获取数据
//        $temp_prolist = D2('ArcView','product')->where(array('status' => 0, 'cid' => $cid))->order("id")->select();
//        $proList = array(); //product表中所有信息
//        foreach ($temp_prolist as $v){
//            $v['url'] = get_content_url($v['id'],$v['cid'],$v['ename'],false,"show");   //添加详情地址
//            $v['advantages'] = explode("#",$v['advantages']);    //技术优势
//            $v['apptitle'] = explode("#",$v['apptitle']);   //典型应用标题
//            $v['apppicurls'] = explode("#",$v['apppicurls']);   //典型应用图
//            $v['appcontent'] = explode("#",$v['appcontent']);   //典型应用内容
//            array_push($proList,$v);    //此处为产品表所有信息
//        }


        /*20170614获取产品*/
        $proList = M('product')->where(array('status' => 0, 'cid' => $cid))->order('id')->select();
        $this->assign('cate', $self);
        $this->assign('flag_son', Category::hasChild($cate, $cid)); //是否包含子类
        $this->assign('title', empty($self['seotitle']) ? $self['name'] : $self['seotitle']);
        $this->assign('keywords', $self['keywords']);
        $this->assign('description', $self['description']);
        $this->assign('cid', $cid);
        // $patterns = array('/^List_/', '/'.C('TMPL_TEMPLATE_SUFFIX').'$/');
        $patterns = array('/' . C('TMPL_TEMPLATE_SUFFIX') . '$/');
        $replacements = array('');
        $template_list = preg_replace($patterns, $replacements, $self['template_list']);
        $temp_arr = array();
        $temparr2 = array();
        foreach ($proList as $k => $v){
            //取出产品概述的图，存到litpic字段
            unset($temparr);
            unset($temparr2);
            $pictureurls = array();
            if (!empty($v['pictureurls'])) {
                $temparr = explode('|||', $v['pictureurls']);
                $temparr2 = explode('$$$', $temparr[1]);
                $proList[$k]['litpic'] = $temparr2[0];
            }
            if($proList[$k]['litpic']==""){
                $temparr = explode('$$$', $v['pictureurls']);
                $proList[$k]['litpic'] = $temparr[0];
            }


            //将产品优势标题转化为数组
            unset($temparr);
            unset($temparr2);
            $advantages = array();
            if (!empty($v['advantages'])) {
                $temparr = explode('|||', $v['advantages']);
                foreach ($temparr as $key => $v2) {
                    $temparr2      = explode('$$$', $v2);
                    $advantages[] = $temparr2[0];
                }
            }

            //将产品优势内容转化为数组
            unset($temparr);
            unset($temparr2);
            $advcontent = array();
            if (!empty($v['advcontent'])) {
                $temparr = explode('|||', $v['advcontent']);
                foreach ($temparr as $key => $v2) {
                    $temparr2      = explode('$$$', $v2);
                    $advcontent[] = $temparr2[0];
                }
            }
            //将产品优势标题和内容整合为一个四维数组
            $dvantages = array();
            for($i=0;$i<5;$i++){
                $dvantages[$i]['title']=$advantages[$i];
                $dvantages[$i]['content']=$advcontent[$i];
            }



            //将典型应用的标题转化为数组
            unset($temparr);
            unset($temparr2);
            $apptitle = array();
            if (!empty($v['apptitle'])) {
                $temparr = explode('|||', $v['apptitle']);
                foreach ($temparr as $key => $v2) {
                    $temparr2      = explode('$$$', $v2);
                    $apptitle[] = $temparr2[0];
                }
            }

            //将典型应用的具体能让转化为数组
            unset($temparr);
            unset($temparr2);
            $appcontent = array();
            if (!empty($v['appcontent'])) {
                $temparr = explode('|||', $v['appcontent']);
                foreach ($temparr as $key => $v2) {
                    $temparr2      = explode('$$$', $v2);
                    $appcontent[] = $temparr2[0];
                }
            }

            //将典型应用的图片转化为数组
            $apppicurls = array();
            if (!empty($v['apppicurls'])) {
                $temparr = explode('|||', $v['apppicurls']);
                foreach ($temparr as $key => $v2) {
                    $temparr2      = explode('$$$', $v2);
                    $apppicurls[] =  $temparr2[0];
                }
            }

            //将典型应用的标题、内容和图片整合为一个四维数组
            $application = array();
            $len = count($apptitle);
            for($i=0;$i<$len;$i++){
                $proList[$k]['application'][$i]['title']=$apptitle[$i];
                $proList[$k]['application'][$i]['content']=$appcontent[$i];
                $proList[$k]['application'][$i]['picurl']=$apppicurls[$i];
            }
            //var_dump($proList[$k]['application']);

            //清空数组，进行下次循环
            unset($advantages);
            unset($apptitle);
            unset($appcontent);
            unset($apppicurls);
            unset($application);

        }


		
        $this->assign('cate', $self);
        $this->assign('flag_son', Category::hasChild($cate, $cid)); //是否包含子类
        $this->assign('title', empty($self['seotitle']) ? $self['name'] : $self['seotitle']);
        $this->assign('keywords', $self['keywords']);
        $this->assign('description', $self['description']);
        $this->assign('cid', $cid);



        // $patterns = array('/^List_/', '/'.C('TMPL_TEMPLATE_SUFFIX').'$/');
        $patterns = array('/' . C('TMPL_TEMPLATE_SUFFIX') . '$/');
        $replacements = array('');
        $template_list = preg_replace($patterns, $replacements, $self['template_list']);

        if (empty($template_list)) {
            $this->error('模板不存在');
        }

        /*特别注意大小写区分*/
        switch ($self['tablename']) {
            case 'product':
				//添加显示产品
				$this->assign('proList', $proList);
				$this->assign('adcontent',$dvantages);
                $this->display($template_list);
                return;
                break;

            case 'page': {
                $cate = M('Category')->Field('content')->find($cid);
                $self['content'] = $cate['content'];
                $this->assign('cate', $self);
                $this->display($template_list);
            }
                return;
                break;

            case 'Contact': {  //联系我们
                $base_info = M('office')->where("id=1")->select();  //公司基本信息
                $office = M('office')->where("id!=1")->select();    //办事处信息
                $base_phone = explode("$$$",$base_info[0]['tel']);

                $this->assign("base",$base_info[0]);
                $this->assign("base_phone",$base_phone);
                $this->assign("office",$office);
                $this->display($template_list);
            }
                return;
                break;

            case 'Detail': {  //自定义详情页面
                $id = I('cid','0');
                $c_detail = M('page_detail')->where("pid=$id")->select();

                $subt = explode("$$$",$c_detail[0]['subtitle']);    //拆分子标题
                $subc = explode("$$$",$c_detail[0]['subcontent']);   //拆分字内容
                $subi = explode("|||",$c_detail[0]['subimg']);  //拆分图片

                $temp = array();    //对应字内容
                $lenth = count($subt);

//                var_dump($subt);
                for($i=0;$i<$lenth;$i++){
                    $temp[$i]['title'] = $subt[$i];
                    $temp[$i]['content'] = $subc[$i];
                    $temp[$i]['pic'] = $subi[$i];
                }

                $this->assign("bigtitle",$c_detail[0]['bigtitle']);     //大标题
                $this->assign("desc",$c_detail[0]['description']);     //概述
                $this->assign("subcontent",$temp);    //对应字内容
                $this->assign("d_example",$c_detail[0]['example']);     //实例

                $this->display($template_list);
            }
                return;
                break;

            case 'Culture':    {  //企业文化
                $res = M('culture')->select();
                $this->assign('plist',$res);
                $this->display($template_list);
            }
                return;
                break;


            case 'Service': {  //服务相关
                $id = I('cid','0');
                $res = M('sever')->where("cid=$id")->select();
                $this->assign("con",$res[0]);
				
                $this->display($template_list);
            }
				return;
                break;


            case 'article':     //文章
            case 'picture':     //图片
            case 'soft':        //软件
            case 'phrase':      //
            case 'newtb':       //新模型
            case 'Event':       //大事记
            case 'Honor':       //资质荣誉



                $this->display($template_list);
                return;
                break;

            default:
                //$this->error('参数错误');
                $userOther = A(ucfirst($self['tablename']));
                $userOther->lists();
                return;
                break;
        }


       $this->display();
    }

	
	/**
	 * 20170425 AJAX获取文章接口
	 */
	public function getarticle(){
		//status=0表示文章状态正常的,flag=1表示是文章
		$list = array();    //最终数据

		$cid = I('cid', 0, 'intval');
		$start = I('start', 0, 'intval');
		$end = I('end', 0, 'intval');
        $ftype = I('ftype',0);

		//$artlist = D2('ArcView','article')->where(array(status => 0,cid => $cid))->limit(4,2)->select();
		
		$artlist = D2('ArcView','article')->where(array('status' => 0,'cid' => $cid))->order("publishtime desc")->limit($start,$end)->select();
		
		//$artlist = D2('ArcView','article')->where(array(status => 0,cid => $cid))->select();
		
		
		foreach($artlist as $v){
			if($v['status']==0){
				$url = get_content_url($v['id'],$v['cid'],$v['ename']);
				array_push($list,
				array(
					'title' => $v['title'],
					'pic' => $v['litpic']=='' ? '/uploads/system/nopic.png' : $v['litpic'],     //判断图片是否为空
					'desc' => $v['description'],
					'publishtime' => date('Y年m月d日', $v['publishtime']),   //时间转换
					'catname' => $v['catename'],
					'url' => $url
					)
				);
			}
		}

		$acount = D2('ArcView','article')->where(array('status' => 0,'cid' => $cid))->count();  //对应分类文章数量


        if($ftype == "pc"){
            header("Content-type:text/json;charset=utf-8"); //设置头部
            echo urldecode(json_encode(array("count"=>$acount,"content"=>$list)));  //滚动分页
        }else{
            foreach($list as $v){   //手机端输出
                //如果没有缩略图
                if($v['pic']==''){
                    $v['pic']='/uploads/system/nopic.png';
                }
                echo
                    "
				<a href=".$v['url']." target='_blank'>
					<li class='clearfix'>
						<div class='imgs'>
							<img src=".$v['pic']." class='img-responsive'/>
						</div>
						<div class='context'>
							<div class='newtitle'>".$v['title']."</div>
							<p>".$v['desc']."……</p>
							<div class='dynamic clearfix'>
								<div class='hxdt'>".$v['catname']."</div>
								<div class='time'>".$v['publishtime']."</div>
							</div>
						</div>
					</li>
				</a>
				";
            }
        }
	}

    /**
     * 20170601 AJAX获取大事件接口
     */
	public function getevent()
    {
        //大事件列表
        $event = M('category')->where("id = 16")->field('content')->select();
        $event = $event[0]['content'];

        $temp_arr = explode('#',$event);    //拆分成数组

        $regex = '/\d{4}-\d{2}-\d{2}|\d{4}-\d{2}|\d{4}/';   //正则匹配规则
        $time_list = array();   //时间列表
        $event_list = array();  //事件列表
        $list = array();    //输出的列表

        foreach ($temp_arr as $t){
            if(preg_match($regex,$t)){
                array_push($time_list,$t);      //时间归类
            }else{
                array_push($event_list,$t);     //事件归类
            }
        }

        $temp = array_combine($time_list,$event_list);  //合并

        foreach ($temp as $k => $v){
            array_push($list,array("time"=>$k,"content"=>$v));
        }
        echo urldecode(json_encode($list)); //输出为json
    }

    /**
     * 20170612 AJAX获取证书接口
     */
    public function gethonor()
    {
        $honor_model = M('honor');
        $list = $honor_model->field('honor,pic')->order("id")->select();
        echo urldecode(json_encode($list)); //输出为json
    }

    /**
     * 20170613 AJAX获取企业文化接口
     */
    public function getculture(){
        $culture_data = M('category')->field("content")->where("id = 17")->select();
        $data = strip_tags($culture_data[0]['content']);    //过滤标签
        $temp = explode("&nbsp",$data);
        echo $data;
        var_dump($temp);
    }




	
	

}
