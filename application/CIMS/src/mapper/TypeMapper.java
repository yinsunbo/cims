package mapper;

import java.util.List;

import entity.Type;

public interface TypeMapper {
    List<Type> getType();
    int addType(Type type);
    int findType(String type_name);
    int updateType(Type type);
    int deleteType(int type_id);
}
