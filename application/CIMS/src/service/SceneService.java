package service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entity.Scene;
import mapper.SceneMapper;

@Service
public class SceneService {
	
	@Resource
	SceneMapper sceneMapper;
	
	public boolean addScene(Scene scene) {
		return sceneMapper.addScene(scene)==1;
	}
	public List<Scene> sceneList(){
		return sceneMapper.sceneList();
	}
	public Scene findScene(int scene_id) {
		return sceneMapper.findScene(scene_id);
	}
	public boolean deleteScene(int scene_id) {
		return sceneMapper.deleteScene(scene_id)==1;
		
	}
	
	public boolean updateScene(Scene scene) {
		return sceneMapper.updateScene(scene)==1;
	}
    public List<Scene> movieFind(int movie_id) {
        
        return sceneMapper.movieFind(movie_id);
    }
    public int[] cinemaFind(int cinema_id) {
        
        return sceneMapper.cinemaFind(cinema_id);
    }
    public List<Scene> movieFindDate(int movie_id) {
        Date date = new Date();
        SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
        String time=day.format(date);
        return sceneMapper.movieFindDate(movie_id,time);
    }
}
