package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Media;
import mapper.MediaMapper;

@Service
public class MediaService {
	
	@Resource
	MediaMapper mediaMapper;

	public MediaMapper getMediaMapper() {
		return mediaMapper;
	}

	public void setMediaMapper(MediaMapper mediaMapper) {
		this.mediaMapper = mediaMapper;
	}
	
	public List<Media> getMedia(){
		return mediaMapper.getMedia();
	}
	
	public List<Media> getVideoMedia(){
		return mediaMapper.getVideoMedia();
	}
	
	public List<Media> getImgMedia(){
		return mediaMapper.getImgMedia();
	}
	
	public boolean addMedia(Media media) {
		
		return mediaMapper.addMedia(media)==1;
	}
	
	public Media findMedia(int media_id) {
		return mediaMapper.findMedia(media_id);
	}
	
	public boolean deleteMedia(int media_id) {
		
		return mediaMapper.deleteMedia(media_id)==1;
	}

	public List<Media> lookup(String keyword) {
		
		return mediaMapper.lookup(keyword);
	}
}
