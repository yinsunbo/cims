package action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.mysql.fabric.xmlrpc.base.Param;

import entity.Media;

import service.MediaService;

@Controller
public class MediaAction {
	@Autowired
	private MediaService mediaService;
	
	public String path = "G:\\workspace\\file\\";
	
	
	@RequestMapping("/mediaList.do")
	public ModelAndView mediaList() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Media> Medias = mediaService.getMedia();
		model.put("Medias", Medias);
		return new ModelAndView("media_home", model);
	}
	
	// 显示视频库页面
	@RequestMapping("/videoList.do")
	public ModelAndView videoMediaList() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Media> Medias = mediaService.getVideoMedia();
		model.put("Medias", Medias);
		return new ModelAndView("media_home", model);
	}

	// 显示图片库页面
	@RequestMapping("/imgList.do")
	public ModelAndView imgMediaList() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Media> Medias = mediaService.getImgMedia();
		model.put("Medias", Medias);
		return new ModelAndView("media_home", model);
	}

	@RequestMapping("/addMediaView.do")
	public String addMediaView() {
		return "addMedia";
	}
	@RequestMapping("/addSuccess.do")
	public ModelAndView addSuccess() {
		Map<String, Object> model = new HashMap<String, Object>();
		String entity = "media";
		model.put("entity", entity);
		return new ModelAndView("addSuccess", model);
	}
	
	@RequestMapping("/addMedia.do")//上传媒体
	public ModelAndView addMedia(Media media, Model m, @RequestParam("file") MultipartFile file) {
		
		if (file != null) {
			long fileSize = file.getSize();
			if (fileSize > 1024*1024) {
				fileSize = fileSize / (1024*1024);
				media.setMedia_size(String.valueOf(fileSize) + "mb");
			} else {
				fileSize = fileSize /1024;
				media.setMedia_size(String.valueOf(fileSize) + "kb");
			}
			String originalFilename = file.getOriginalFilename();
			if (media.getMedia_name().equals("")) {
				media.setMedia_name(originalFilename);
			}
			String newFileName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));	
			File newFile = null;
			try {
				if(media.getMedia_type().equals("图片")) {
					newFile= new File(path +"img\\" + newFileName);
					media.setMedia_url("img/"+newFileName);
				}else if(media.getMedia_type().equals("视频")){
					newFile = new File(path +"video\\" + newFileName);
					media.setMedia_url("video/"+newFileName);
				}
				file.transferTo(newFile);
				
			} catch (IllegalStateException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				m.addAttribute("info", "上传失败");
				return new ModelAndView("addMedia");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				m.addAttribute("info", "上传失败");
				return new ModelAndView("addMedia");
			}
			try {
				if (mediaService.addMedia(media)) {
					return new ModelAndView("redirect:/addSuccess.do");
				} else {
					m.addAttribute("info", "上传失败");
					return new ModelAndView("addMedia");
				}
			} catch (Exception e) {
				System.out.println(e);
				m.addAttribute("info", "上传失败");
				return new ModelAndView("addMedia");
			}
		} else {

			m.addAttribute("info", "上传失败,没有选择媒体文件");
			return new ModelAndView("addMedia");
		}

	}

	@RequestMapping("/findMedia.do")
	public ModelAndView findMedia(int media_id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Media media = mediaService.findMedia(media_id);
		model.put("media", media);
		return new ModelAndView("mediaDetails", model);
	}
	
	@RequestMapping("/lookupMedia.do")//搜索
	public ModelAndView lookup(String keyword) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Media> Medias = mediaService.lookup("%"+keyword+"%");
		model.put("Medias", Medias);
		return new ModelAndView("media_home", model);
	}
	
	@RequestMapping("/deleteMedia.do")//删除
	public ModelAndView deleteMedia(int media_id,Model m) {
		Map<String, Object> model = new HashMap<String, Object>();
		Media media = mediaService.findMedia(media_id);
		model.put("media", media);
		String entity="media";
		model.put("entity", entity);
		File file=new File(path+"\\"+media.getMedia_url());
		if(mediaService.deleteMedia(media_id)) {
			file.delete();
			return new ModelAndView("deleteSuccess",model);
		}else {
			m.addAttribute("info", "删除失败");
			return new ModelAndView("MediaDetails", model);
		}
		
	}
	
}
