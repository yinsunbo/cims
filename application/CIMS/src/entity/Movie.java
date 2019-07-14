package entity;

public class Movie {
	private int movie_id;
	private String movie_name;
	private int type_id;
	private String movie_introduce;
	private String movie_language;
	private String movie_date;
	private String key_word;
	private String img_url;
	public String getKey_word() {
		return key_word;
	}
	public void setKey_word(String key_word) {
		this.key_word = key_word;
	}
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	
	public String getMovie_introduce() {
		return movie_introduce;
	}
	public void setMovie_introduce(String movie_introduce) {
		this.movie_introduce = movie_introduce;
	}
	public String getMovie_language() {
		return movie_language;
	}
	public void setMovie_language(String movie_language) {
		this.movie_language = movie_language;
	}
    public String getImg_url() {
        return img_url;
    }
    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }
    public int getType_id() {
        return type_id;
    }
    public void setType_id(int type_id) {
        this.type_id = type_id;
    }
    @Override
    public String toString() {
        return "Movie [movie_id=" + movie_id + ", movie_name=" + movie_name + ", type_id=" + type_id
                + ", movie_introduce=" + movie_introduce + ", movie_language=" + movie_language + ", movie_date="
                + movie_date + ", key_word=" + key_word + ", img_url=" + img_url + "]";
    }
}
