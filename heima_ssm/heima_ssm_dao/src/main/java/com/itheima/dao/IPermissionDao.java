package com.itheima.dao;

import com.itheima.domain.Permission;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IPermissionDao {

    @Select("select * from permission where id in (select permissionId from role_permission where roleId= #{id})")
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    @Select("select * from permission")
    public List<Permission> findAll() throws Exception;

    @Insert("insert into permission(id,permissionName,url) values(#{id},#{permissionName},#{url})")
    void save(Permission permission) throws Exception;

    @Delete("delete from permission where id = #{id}")
    void deleteById(String id);

    @Delete("delete from role_permission where permissionId = #{id}")
    void deleteFromRole_Permission(String id);

    @Select("select * from permission where id = #{id}")
    public Permission findById(String id) throws Exception;
}
