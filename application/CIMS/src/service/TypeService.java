package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sun.swing.internal.plaf.basic.resources.basic;

import entity.Type;
import mapper.TypeMapper;

@Service
public class TypeService {
    @Resource
    TypeMapper typeMapper;
    
    public List<Type> getType(){
        return typeMapper.getType();
    }
    public int addType(Type type) {
        return typeMapper.addType(type);
    }
    
    public boolean isType(String type_name) {
        return typeMapper.findType(type_name)>0;
    }
    
    public boolean updateType(Type type) {
        return typeMapper.updateType(type)==1;
    }
    public boolean deleteType(int type_id) {
        return typeMapper.deleteType(type_id)==1;
    }
    public boolean check(String type_name){
        if(type_name==null||type_name.equals("")) {
            return true;
        }
        if(type_name.length()>5) {
            return true;
        }
        if(isType(type_name)) {
            return true;
        }
        return false;
    }
    
    public Map<String, String> Result(String type_name){
        Map<String, String> map = new HashMap<String, String>();
        if(type_name==null||type_name.equals("")) {
            map.put("e", "不允许重复类型");
        }
        if(type_name.length()>5) {
            map.put("e", "类型名称过长");
        }
        if(isType(type_name)) {
            map.put("e", "类型已存在");
        }
        return map;
    }
    
    
}
