<?php
/**
 *　                  oooooooooooo
 *
 *                  ooooooooooooooooo
 *                       o
 *                      o
 *                     o        o
 *                    oooooooooooo
 *
 *         ～～         ～～         　　～～
 *       ~~　　　　　~~　　　　　　　　~~
 * ~~～~~～~~　　　~~~～~~～~~～　　　~~~～~~～~~～
 * ·······              ~~XYHCMS~~            ·······
 * ·······  闲看庭前花开花落 漫随天外云卷云舒 ·······
 * ·············     www.xyhcms.com     ·············
 * ··················································
 * ··················································
 *
 * @Author: gosea <gosea199@gmail.com>
 * @Date:   2014-06-21 10:00:00
 * @Last Modified by:   gosea
 * @Last Modified time: 2016-06-21 12:33:38
 */
namespace Manage\Controller;

class PublicController extends CommonController
{

    public function index()
    {

    }

    //后台内容主页
    public function main()
    {
        $article_model = M('article');
        $product_model = M('product');
        /*文章信息*/
        $article_sum = $article_model->count(); //所有文章总数
        $news = $article_model->where("cid=18")->count(); //所有新闻总数
        $work = $article_model->where("cid=57")->count(); //所有招聘总数
        $security = $article_model->where("cid=41")->count(); //所有安全公告总数
        $article_info = array(
            "sum" => $article_sum,
            "news" => $news,
            "work" => $work,
            "security" => $security
        );

        /*产品信息*/
        $product_sum = $product_model->count();
        $fw = $product_model->where("cid=21")->count();
        $intrusion = $product_model->where("cid=22")->count();
        $audit = $product_model->where("cid=23")->count();
        $product_info = array(
            "sum" => $product_sum,  //总数
            "fw" => $fw,     //防火墙数量
            "ruqing" => $intrusion, //入侵检测
            "shenji" => $audit, //安全审计
            "other" => $product_sum-$fw-$intrusion-$audit   //其他数量
        );




        $_mysql_ver = M()->query('SELECT VERSION() as ver;');   //查询Mysql版本
        if (is_array($_mysql_ver)) {
            $mysql_ver = $_mysql_ver[0]['ver'];
        } else {
            $mysql_ver = '';
        }






        /* uploads */
//        $this->assign('environment_upload', ini_get('file_uploads') ? ini_get('upload_max_filesize') : '不支持');



        $this->assign('article',$article_info); //文章信息
        $this->assign('product',$product_info); //产品信息


        $this->assign('mysql_ver', $mysql_ver); //mysql版本
        $this->assign('saeflag', defined('APP_SAE_FLAG') ? 1 : 0);
        $this->assign('phpversion', phpversion());  //php版本
        $this->assign('software', $_SERVER["SERVER_SOFTWARE"]); //服务器版本
        $this->assign('os', PHP_OS);    //操作环境
        $this->assign('cms_info', rw_data('ver', '', './Data/resource/'));
        $this->display();
    }

    public function editorMethod()
    {
        $_editor = new \Org\Editor\Ueditor();
    }

    //上传图片
    /**
     * 上传图片
     * @param  integer $img_flag 是否是图片(带缩略图)
     * @return [type]               [description]
     */
    public function upload($img_flag = 0)
    {
        header("Content-Type:text/html; charset=utf-8"); //不然返回中文乱码
        $result   = array('state' => '失败', 'url' => '', 'name' => '', 'original' => '');
        $sub_path = I('post.sfile', '', 'trim,htmlspecialchars'); //判断其他子目录

        $img_flag = empty($img_flag) ? 0 : 1;

        $yun_upload    = new \Common\Lib\YunUpload($img_flag, $sub_path);
        $upload_result = $yun_upload->upload();

        if ($upload_result['status']) {
            $result['state'] = 'SUCCESS';
            $result['info']  = $upload_result['data'];
        } else {
            $result['state'] = $upload_result['info'];
        }
        echo json_encode($result);

    }

    //文件/夹管理
    public function browseFile($spath = '', $stype = 'file')
    {
        $base_path  = '/uploads/img1';
        $enocdeflag = I('encodeflag', 0, 'intval');
        switch ($stype) {
            case 'picture':
                $base_path = '/uploads/img1';
                break;
            case 'file':
                $base_path = '/uploads/file1';
                break;
            case 'ad':
                $base_path = '/uploads/abc1';
                break;
            default:
                exit('参数错误');
                break;
        }

        if ($enocdeflag) {
            $spath = base64_decode($spath);
        }

        $spath = str_replace('.', '', $spath);
        if (strpos($spath, $base_path) === 0) {
            $spath = substr($spath, strlen($base_path));
        }

        $path = $base_path . '/' . $spath;
        $path = str_replace('//', '/', $path);

        $dir  = new \Common\Lib\Dir('.' . $path); //加上.
        $list = $dir->toArray();
        for ($i = 0; $i < count($list); $i++) {

            $list[$i]['isImg'] = 0;
            if ($list[$i]['isFile']) {
                $url = __ROOT__ . rtrim($path, '/') . '/' . $list[$i]['filename'];
                $ext = explode('.', $list[$i]['filename']);
                $ext = end($ext);
                if (in_array($ext, array('jpg', 'png', 'gif'))) {
                    $list[$i]['isImg'] = 1;
                }
            } else {
                //为了兼容URL_MODEL(1、2)
                if (in_array(C('URL_MODEL'), array(1, 2, 3))) {
                    $url = U('Public/browseFile', array('stype' => $stype, 'encodeflag' => 1, 'spath' => base64_encode(rtrim($path, '/') . '/' . $list[$i]['filename'])));
                } else {
                    $url = U('Public/browseFile', array('stype' => $stype, 'spath' => rtrim($path, '/') . '/' . $list[$i]['filename']));
                }

            }
            $list[$i]['url']  = $url;
            $list[$i]['size'] = get_byte($list[$i]['size']);
        }
        //p($list);
        $parentpath = substr($path, 0, strrpos($path, '/'));
        //为了兼容URL_MODEL(1、2)
        if (in_array(C('URL_MODEL'), array(1, 2, 3))) {
            $purl = U('Public/browseFile', array('spath' => base64_encode($parentpath), 'encodeflag' => 1, 'stype' => $stype));
        } else {
            $purl = U('Public/browseFile', array('spath' => $parentpath, 'stype' => $stype));
        }

        $this->assign('purl', $purl);
        $this->assign('vlist', $list);
        $this->assign('stype', $stype);
        $this->assign('type', '浏览文件');
        $this->display();

    }

}
