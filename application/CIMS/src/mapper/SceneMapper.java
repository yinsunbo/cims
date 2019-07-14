package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Scene;

public interface SceneMapper {
	int addScene(Scene scene);
	List<Scene> sceneList();
	Scene findScene(int scene_id);
	int deleteScene(int scene_id);
	int updateScene(Scene scene);
    List<Scene> movieFind(int movie_id);
    int[] cinemaFind(int cinema_id);
    List<Scene> movieFindDate( @Param("movie_id")int movie_id, @Param("time") String time);
    
}
