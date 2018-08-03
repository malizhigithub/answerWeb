package cn.edu.lingnan.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsList;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.TempUrl;
import cn.edu.lingnan.service.OptionsService;
import cn.edu.lingnan.service.QuestionService;
import cn.edu.lingnan.service.QuestionTypeService;
import cn.edu.lingnan.service.TempUrlService;
import cn.edu.lingnan.utils.BOSUtil;

@Controller
public class QuestionController extends BaseController {
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuestionTypeService questionTypeService;
	
	@Autowired
	private OptionsService optionsService;
	
	@Autowired
	private TempUrlService tempUrlService;
	

	/**
	 * 分页根据条件查找试题
	 * @param question
	 * @param map
	 * @param pn
	 * @author lizhi
	 */
	@RequestMapping("/selectQuestion")
	public String selectQuestion(Question question, Map<String, Object> map,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn,@RequestParam("toid")Integer toid) {
		// 每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn, 6);
		List<Question> list = questionService.selectQuestionByExample(question);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("pageInfo", pageInfo);
		//找出所有三级菜单类型，返回到前端多条件选择
		map.put("questionTypeList",questionTypeService.getAllQuestionType());
		//在选项卡一中显示
		map.put("toid", toid);
		// 到时候前端写出网页后再修改到具体的页面
		return "/admin/questionList";
	}
	
	/**
	 * 更新试题第一步
	 * @param question
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionFirst")
	public String updateQuestionFirst(@RequestParam("questionno")Integer questionno,Map<String,Object> map,@RequestParam("pn") Integer pn){
		//找出具体题目
		map.put("question",questionService.getQuestionByKey(questionno));
		//找出题目的候选答案
		map.put("optionsList",optionsService.getQuestionOptions(questionno));
		//找出所有三级菜单类型，返回到更新页面
		map.put("questionTypeList",questionTypeService.getAllQuestionType());
		map.put("pn",pn);
		return "/admin/updateQuestion";
	}
	
	/**
	 * 更新试题第二步
	 * @param question
	 * @param pn
	 * @author lizhi
	 */
	@RequestMapping("/updateQuestionSecond")
	public String updateQuestionSecond(Question question,@RequestParam("pn") Integer pn,OptionsList optionsList,String oldContent,String oldDescription){
		
		//如果不同文件名，就要移动
		if(!question.getContent().equals(oldContent)){
		String strExtension = question.getContent().substring(question.getContent().lastIndexOf('.') + 1);
		String path = "/resource/images/question/";
		if(strExtension.equals("mp3")){
			path = "/resource/audio/";
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
		}else if(strExtension.equals("mp4")){
			path = "/resource/video/";
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
		}else if(strExtension.equals("jpg")||strExtension.equals("gif") ||strExtension.equals("png") || strExtension.equals("bmp")){
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
			}
		}
		
		//如果不同文件名，就要删除原来的
		if(!question.getContent().equals(oldContent)){
			//把原来的文件删除
			String path="";
			String oldExtension = oldContent.substring(oldContent.lastIndexOf('.') + 1);
			String oldpath = "/resource/images/question/";
			if(oldExtension.equals("mp3")){
				path = "/resource/audio/";
				BOSUtil.deleteFile(path+oldContent);
			}else if(oldExtension.equals("mp4")){
				path = "/resource/video/";
				BOSUtil.deleteFile(path+oldContent);
			}else if(oldExtension.equals("jpg")||oldExtension.equals("gif") || oldExtension.equals("png") || oldExtension.equals("bmp")){
				BOSUtil.deleteFile(path+oldContent);
			}
		}
		
		
		//对答案图片进行更新
		if(question.getDesstatus()==2){
			if(!question.getDescription().equals(oldDescription)){
				String path = "/resource/images/answer/";
				//移动答案图片
				BOSUtil.moveFile("/temp/"+question.getDescription(),path+question.getDescription());
				//删除原来的答案图片
				BOSUtil.deleteFile(path+oldDescription);
			}
		}
		
		
		
		questionService.updateSelective(question);
		for(Options options:optionsList.getOptionsList()){
			optionsService.updateByPrimaryKey(options);
		}
		redirectAttributes.addAttribute("pn",pn);
		redirectAttributes.addAttribute("toid",1);
		return "redirect:/selectQuestion";
	}
	
	
	

	/**
	 * 上传题目的图片，视频，音频
	 * @param file
	 * @param typename
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/addQuestionFile", produces = "text/html;charset=UTF-8")
	public String addQuestionFile(@RequestParam(value = "file", required = false) MultipartFile file,@RequestParam(value="desFile",required=false) MultipartFile desFile
			,@RequestParam(value="flag",required=false) Integer flag	) throws IllegalStateException, IOException {
		if(flag == 1){
	/*	String strExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);
		String path = "/resource/images/question/";
		if(strExtension.equals("mp3")){
			path = "/resource/audio/";
		}else if(strExtension.equals("mp4")){
			path = "/resource/video/";
		}*/

		// fileName唯一性
		int a = ThreadLocalRandom.current().nextInt(100,999);
		String fileName =+ a +"-"+ System.currentTimeMillis()+ file.getOriginalFilename();
	 
		 //上传到临时文件夹
        String typeImagesTempPath = "/temp/"+fileName;
		BOSUtil.upload(file, typeImagesTempPath);
		
		//插入上传记录
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		TempUrl tempUrl = new TempUrl(null,fileName,format.format(new Date()));
		tempUrlService.addTempUrl(tempUrl);
		return fileName;
		
		//这是答案详解图片的预览
		}else if(flag == 2){
			String path = "/resource/images/answer/";
			// fileName唯一性
			int a = ThreadLocalRandom.current().nextInt(100,999);
			String fileName =+ a +"-"+ System.currentTimeMillis()+ desFile.getOriginalFilename();

			 //上传到临时文件夹
	        String typeImagesTempPath = "/temp/"+fileName;
			BOSUtil.upload(desFile, typeImagesTempPath);
			
			//插入上传记录
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
			TempUrl tempUrl = new TempUrl(null,fileName,format.format(new Date()));
			tempUrlService.addTempUrl(tempUrl);
			return fileName;
		}
		return "error";
	}
	
	
	/**
	 * 增加试题
	 * @param question
	 * @author lizhi
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/addQuestion")
	public String addQuestion(Question question,OptionsList optionsList,@RequestParam("pn") Integer pn) throws IllegalStateException, IOException{
		
		
		String strExtension = question.getContent().substring(question.getContent().lastIndexOf('.') + 1);
		String path = "/resource/images/question/";
		if(strExtension.equals("mp3")){
			path = "/resource/audio/";
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
		}else if(strExtension.equals("mp4")){
			path = "/resource/video/";
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
		}else if(strExtension.equals("jpg") || strExtension.equals("gif") || strExtension.equals("png") || strExtension.equals("bmp")){
			//将文件从临时文件夹移动到目标文件夹
			BOSUtil.moveFile("/temp/"+question.getContent(),path+question.getContent());
		}
		
		
		//移动答案图片
		if(question.getDesstatus()==2){
				String desImapgePath = "/resource/images/answer/";
				//移动答案图片
				BOSUtil.moveFile("/temp/"+question.getDescription(),desImapgePath+question.getDescription());
		}
		
		
		//插入数据库
		questionService.insertQuestion(question);
		for(Options options:optionsList.getOptionsList()){
			options.setQuestionno(question.getQuestionno());
			optionsService.insert(options);
		}
		redirectAttributes.addAttribute("pn",pn);
		redirectAttributes.addAttribute("toid",1);
		return "redirect:/selectQuestion";
	}
	
	/**
	 * 根据试题id删除试题
	 * @param id
	 * @author lizhi
	 */
	/*@RequestMapping(value="/deleteQuestion/{id}",method=RequestMethod.DELETE)
	public String deleteQuestion(@PathVariable(value="id") Integer id){
		questionService.deleteQuestion(id);
		return "/admin/index";
	}*/
	
	/**
	 * 根据试题id删除试题
	 * @param id
	 * @author lizhi
	 */
	@RequestMapping(value="/deleteQuestion")
	public String deleteQuestion(@RequestParam("questionno") Integer questionno,@RequestParam("pn") Integer pn){
		Question question = questionService.getQuestionByKey(questionno);
		
		questionService.deleteQuestion(questionno);
		redirectAttributes.addAttribute("pn", pn);
		redirectAttributes.addAttribute("toid",1);
		
		//删除题目内容对应的资源
		if(question.getConstatus()!=1){
			String contentExtension = question.getContent().substring(question.getContent().lastIndexOf('.') + 1);
			String path = "/resource/images/question/";
			if(contentExtension.equals("mp3")){
				path = "/resource/audio/";
				BOSUtil.deleteFile(path+question.getContent());
			}else if(contentExtension.equals("mp4")){
				path = "/resource/video/";
				BOSUtil.deleteFile(path+question.getContent());
			}else if(contentExtension.equals("jpg") || contentExtension.equals("gif") || contentExtension.equals("png") || contentExtension.equals("bmp")){
				BOSUtil.deleteFile(path+question.getContent());
			}
		}
		//删除题目答案对应的资源
		if(question.getDesstatus()==2){
			BOSUtil.deleteFile("/resource/images/answer/"+question.getDescription());
		}
		
		return "redirect:/selectQuestion";
	}
	
}
