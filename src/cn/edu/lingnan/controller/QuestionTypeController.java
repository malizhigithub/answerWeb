package cn.edu.lingnan.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.TempUrl;
import cn.edu.lingnan.pojo.UploadFile;
import cn.edu.lingnan.service.QuestionTypeService;
import cn.edu.lingnan.service.TempUrlService;
import cn.edu.lingnan.utils.BOSUtil;

@Controller
public class QuestionTypeController extends BaseController {

	@Autowired
	private QuestionTypeService questionTypeService;

	@Autowired
	private TempUrlService tempUrlService;
	

	/**
	 * 一级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionFirstType")
	public Map questionFirstType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 每页显示6条数据，且当前页是参数pn
		PageHelper.startPage(pn, 6);
		List<QuestionType> firstTypeList = questionTypeService.questionFirstType(questionType);
		PageInfo pageInfo = new PageInfo<>(firstTypeList, 5);
		map.put("pageInfo", pageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultFirstType = questionTypeService.questionFirstType(new QuestionType());
		map.put("defaultFirstType", defaultFirstType);
		return map;
	}

	/**
	 * 二级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionSecondType")
	public Map questionSecondType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> secondTypeList = questionTypeService.questionSecondType(questionType, pn);

		PageInfo<QuestionType> secondpageInfo = new PageInfo<>(secondTypeList);
		map.put("pageInfo", secondpageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultSecondType = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("defaultSecondType", defaultSecondType);
		List<QuestionType> defaultFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("defaultFirstTypeList", defaultFirstTypeList);
		return map;
	}

	/**
	 * 三级菜单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/questionThreeType")
	public Map questionThreeType(QuestionType questionType,
			@RequestParam(required = false, value = "pn", defaultValue = "1") Integer pn) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> threeTypeList = questionTypeService.questionThreeType(questionType, pn);

		PageInfo<QuestionType> threepageInfo = new PageInfo<>(threeTypeList);
		map.put("pageInfo", threepageInfo);
		map.put("questionType", questionType);
		List<QuestionType> defaultThreeType = questionTypeService.questionThreeType(new QuestionType(), -1);
		map.put("defaultThreeType", defaultThreeType);
		List<QuestionType> defaultSecondType = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("defaultSecondTypeList", defaultSecondType);
		return map;
	}

	/**
	 * 更新一级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirstTypeFirst")
	public String updateQuestionFirstTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		map.put("pn", pn);
		return "/admin/updateQuestionFirstType";
	}
	
	
	/**
	 * 更新一级菜单第二步，在页面显示所有信息
	 * 使用JSR303验证
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirstTypeSecond")
	public String updateQuestionFirstTypeSecond(@Valid QuestionType questionType,Integer pn,Map<String,Object> map,String oldImageUrl) {
		
		//如果图片资源变化，则需要更新资源
		if(!questionType.getImageurl().equals(oldImageUrl)){
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+questionType.getImageurl(),"/resource/images/type/"+questionType.getImageurl());
			//删除目标文件夹中原来的文件
			if(oldImageUrl !=""&&oldImageUrl!=null&&!oldImageUrl.equals("upload.jpg")){
				BOSUtil.deleteFile("/resource/images/type/"+oldImageUrl);
			}
		}
		
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		map.put("toid", 1);
		map.put("FirstTypepn", pn);
		return "/admin/questionType";
	}
	
	
	
	/**
	 * 更新二级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecondTypeFirst")
	public String updateQuestionSecondTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		//获取一级菜单作为上级菜单
		List<QuestionType> questionFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("questionFirstTypeList", questionFirstTypeList);
		map.put("pn", pn);
		return "/admin/updateQuestionSecondType";
	}
	/**
	 * 更新二级菜单第二步
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecondTypeSecond")
	public String updateQuestionSecondTypeSecond(QuestionType questionType,Integer pn,Map<String,Object> map,String oldImageUrl) {
		
		//如果图片资源变化，则需要更新资源
		if(!questionType.getImageurl().equals(oldImageUrl)){
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+questionType.getImageurl(),"/resource/images/type/"+questionType.getImageurl());
			//删除目标文件夹中原来的文件
			if(oldImageUrl !=""&&oldImageUrl!=null&&!oldImageUrl.equals("upload.jpg")){
				BOSUtil.deleteFile("/resource/images/type/"+oldImageUrl);
			}
		}
		
		
		
		//更新二级菜单
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		
		map.put("toid", 2);
		map.put("SecondTypepn", pn);
		return "/admin/questionType";
	}
	
	
	
	
	
	/**
	 * 更新三级菜单第一步，在页面显示所有信息
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionThreeTypeFirst")
	public String updateQuestionThreeTypeFirst(Integer typeno,Integer pn,Map<String,Object> map) {
		map.put("questionType", questionTypeService.getQuestionTypeByPrimaryKey(typeno));
		//查出所有二级菜单，作为上级菜单
		List<QuestionType> questionSecondTypeList = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("questionSecondTypeList", questionSecondTypeList);
		
		map.put("pn", pn);
		return "/admin/updateQuestionThreeType";
	}
	
	
	/**
	 * 更新三级菜单第二步
	 * 
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionThreeTypeSecond")
	public String updateQuestionThreeTypeSecond(QuestionType questionType,Integer pn,Map<String,Object> map,String oldImageUrl) {
		//如果图片资源变化，则需要更新资源
		if(!questionType.getImageurl().equals(oldImageUrl)){
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+questionType.getImageurl(),"/resource/images/type/"+questionType.getImageurl());
			//删除目标文件夹中原来的文件
			if(oldImageUrl !=""&&oldImageUrl!=null&&!oldImageUrl.equals("upload.jpg")){
				BOSUtil.deleteFile("/resource/images/type/"+oldImageUrl);
			}
		}
		
		//更新三级菜单
		questionTypeService.updateQuestionTypeByPrimaryKey(questionType);
		
		map.put("toid", 3);
		map.put("ThreeTypepn", pn);
		return "/admin/questionType";
	}

	

	/**
	 * 上传菜单图片并且预览
	 * @param file
	 * @param typename
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/addQuestionTypeImages", produces = "text/html;charset=UTF-8")
	public String addQuestionTypeImages(@RequestParam(value = "file", required = false) MultipartFile file
			) throws IllegalStateException, IOException {
		
		

		// fileName唯一性
		int a = ThreadLocalRandom.current().nextInt(10000, 99999);
		String fileName =+ a +"-"+ System.currentTimeMillis() + "-"+file.getOriginalFilename();

        
        //String typeImagesPath = "/resource/images/type/"+fileName;
        //上传到临时文件夹
        String typeImagesTempPath = "/temp/"+fileName;
		BOSUtil.upload(file, typeImagesTempPath);
		
		//插入上传记录
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		TempUrl tempUrl = new TempUrl(fileName,format.format(new Date()));
		tempUrlService.addTempUrl(tempUrl);
		
		return fileName;
	}
	
	/**
	 * 增加一级菜单
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionFirstType")
	public String addQuestionFirstType(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename){
		
		//将文件从临时文件夹移动到目标文件夹
		BOSUtil.moveFile("/temp/"+filename,"/resource/images/type/"+filename);
		
		//插入数据库
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 1);
		session.setAttribute("FirstTypepn",99999);
		return "/admin/questionType";
	}
	
	

	/**
	 * 新增二级菜单第一步，查出所有二级菜单的上级菜单（增加二级菜单只需普通管理员权限）
	 * 
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionSecondTypeFirst")
	public String addQuestionSecondType(Map<String,Object> map) {
		List<QuestionType> questionFirstTypeList = questionTypeService.questionFirstType(new QuestionType());
		map.put("questionFirstTypeList", questionFirstTypeList);
		return "/admin/addQuestionSecondType";
	}
	
	
	/**
	 * 增加二级菜单第二步
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionSecondTypeSecond")
	public String addQuestionSecondTypeSecond(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename,Integer belongtypeno){
		
		//将文件从临时文件夹移动到目标文件夹
		BOSUtil.moveFile("/temp/"+filename,"/resource/images/type/"+filename);
				
		//插入数据库
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionType.setBelongtypeno(belongtypeno);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 2);
		session.setAttribute("SecondTypepn",99999);
		return "/admin/questionType";
	}
	
	

	/**
	 * 新增三级菜单第一步，查出所有二级菜单
	 * 
	 * @param questionType
	 * @return
	 */
	@RequestMapping("/addQuestionThreeTypeFirst")
	public String addQuestionThreeTypeFirst(Map<String,Object> map) {
		List<QuestionType> questionSecondTypeList = questionTypeService.questionSecondType(new QuestionType(), -1);
		map.put("questionSecondTypeList", questionSecondTypeList);
		return "/admin/addQuestionThreeType";
	}
	
	/**
	 * 增加三级菜单第二步
	 * @param file
	 * @param typename
	 * @return
	 */
	@RequestMapping("/addQuestionThreeTypeSecond")
	public String addQuestionThreeTypeSecond(@RequestParam(value="filename",required=false) String filename,@RequestParam("typename") String typename,Integer belongtypeno){
		//将文件从临时文件夹移动到目标文件夹
		BOSUtil.moveFile("/temp/"+filename,"/resource/images/type/"+filename);
				
		//插入数据库
		QuestionType questionType = new QuestionType();
		questionType.setTypename(typename);
		questionType.setImageurl(filename);
		questionType.setBelongtypeno(belongtypeno);
		questionTypeService.addQuestionType(questionType);
		session.setAttribute("toid", 3);
		session.setAttribute("ThreeTypepn",99999);
		return "/admin/questionType";
	}
	

	/**
	 * 删除一级菜单(需要超级管理员权限,通过拦截器获取权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionFirstType")
	public String deleteQuestionFirstType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		QuestionType questionType = questionTypeService.getQuestionTypeByPrimaryKey(typeno);
		
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",1);
		session.setAttribute("FirstTypepn", pn);
		
		//删除一级菜单图片
		BOSUtil.deleteFile("/resource/images/type/"+questionType.getImageurl());
		
		return "/admin/questionType";
	}

	/**
	 * 删除二级菜单(只需普通管理员权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionSecondType")
	public String deleteQuestionSecondType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		QuestionType questionType = questionTypeService.getQuestionTypeByPrimaryKey(typeno);
		
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",2);
		session.setAttribute("SecondTypepn", pn);
		
		//删除二级菜单图片
		BOSUtil.deleteFile("/resource/images/type/"+questionType.getImageurl());
		
		return "/admin/questionType";
	}

	/**
	 * 删除三级菜单(只需普通管理员权限) 数据库已有级联删除，不再做业务处理
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteQuestionThreeType")
	public String deleteQuestionThreeType(@RequestParam(value = "typeno") Integer typeno,Integer pn) {
		QuestionType questionType = questionTypeService.getQuestionTypeByPrimaryKey(typeno);
		
		questionTypeService.deleteQuestionType(typeno);
		session.setAttribute("toid",3);
		session.setAttribute("ThreeTypepn", pn);
		
		//删除三级菜单图片
		BOSUtil.deleteFile("/resource/images/type/"+questionType.getImageurl());
		return "/admin/questionType";
	}
	
	/**
	 * 根据目录名查看一级菜单是否存在重复目录名
	 * @param typename
	 * @return  存在返回true
	 */
	@ResponseBody
	@RequestMapping("/validataFirstType")
	public boolean validataFirstType(String typename){
		if(questionTypeService.getQuestionFirstTypeByName(typename).size()!=0){
			return true;
		}
		return false;
		
	}
	
}
