package entity;

/**
 * @author Administrator
 *
 */
public class Media {
	private int media_id;//媒体ID
	private String media_name;//媒体名称
	private String media_type;//媒体类型 0代表图片 1代表视频
	private String media_url;//媒体位置
	private String media_time;//上传时间
	private String media_introduce;//介绍
	private String media_size;//媒体大小
	public int getMedia_id() {
		return media_id;
	}
	public void setMedia_id(int media_id) {
		this.media_id = media_id;
	}
	public String getMedia_name() {
		return media_name;
	}
	public void setMedia_name(String media_name) {
		this.media_name = media_name;
	}
	public String getMedia_type() {
		return media_type;
	}
	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}
	public String getMedia_url() {
		return media_url;
	}
	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}
	public String getMedia_time() {
		return media_time;
	}
	public void setMedia_time(String media_time) {
		this.media_time = media_time;
	}
	public String getMedia_introduce() {
		return media_introduce;
	}
	public void setMedia_introduce(String media_introduce) {
		this.media_introduce = media_introduce;
	}
	public String getMedia_size() {
		return media_size;
	}
	public void setMedia_size(String media_size) {
		this.media_size = media_size;
	}
	
	
}
