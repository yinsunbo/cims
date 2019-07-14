package action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import entity.Type;
import service.TypeService;

@Controller
public class TypeAction {
    
    @Autowired
    TypeService typeService;
    
    @RequestMapping("/type")
    public ModelAndView getType(HttpSession session) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Type> types = typeService.getType();
        model.put("types", types);
        return new ModelAndView("type",model);
    }
    
    @ResponseBody
    @RequestMapping("/type/addType")
    public String addType(String type_name) {
        Gson gson=new Gson();
        if(typeService.check(type_name)) {//校验数据
           Map<String, String> map = typeService.Result(type_name);
           return gson.toJson(map);
        }
        Type type=new Type();
        type.setType_name(type_name);
        typeService.addType(type);
        return gson.toJson(type);
    }
    
    @ResponseBody
    @RequestMapping("/type/updateType")
    public String updateType(Type type) {
        Gson gson = new Gson();
        String type_name = type.getType_name();
        
        if(typeService.check(type_name)) {//校验数据
            Map<String, String> map = typeService.Result(type_name);
            return gson.toJson(map);
         }
        if(typeService.updateType(type)) {
            return gson.toJson(type);
        }
        return "";
        
    }
    
    @ResponseBody
    @RequestMapping("/type/deleteType")
    public String deleteType(int type_id) {
        Gson gson = new Gson();
        Map<String, String> map = new HashMap<>();
        if(typeService.deleteType(type_id)) {
            map.put("success", "删除成功");
            
            return gson.toJson(map);
        }
        map.put("failed", "删除成功");
        return gson.toJson(map);
        
    }
    
}
