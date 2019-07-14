package mapper;

import java.util.List;

import entity.Media;

public interface MediaMapper {
	public List<Media> getMedia();
	public List<Media> getVideoMedia();
	public List<Media> getImgMedia();
	public int addMedia(Media media);
	public int deleteMedia(int media_id);
	public Media findMedia(int media_id);
	public List<Media> lookup(String keyword);
	
	
}
