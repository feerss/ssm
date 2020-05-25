package com.itheima.dao;

import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    //根据用户id查询到所有对应的角色
    @Select("select * from role where id in (select roleId from users_role where userId= #{userId})")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType =java.util.List.class,
                    many = @Many(select = "com.itheima.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(String userId) throws Exception;

    @Select("select * from role")
    public List<Role> findAll() throws Exception;

    @Insert("insert into role(id,roleName,roleDesc) values(#{id},#{roleName},#{roleDesc})")
    public void save(Role role);

    @Select("select * from role where id =#{roleId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType =java.util.List.class,
                    many = @Many(select = "com.itheima.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public Role findById(String roleId) throws Exception;

    @Delete("delete from users_role where roleId=#{roleId}")
    void deleteRoleFromUser_RoleByRoleId(String roleId);

    @Delete("delete from role_permission where roleId = #{roleId}")
    void deleteRoleFromRole_PermissionByRoleId(String roleId);

    @Delete("delete from role where id = #{roleId}")
    void deleteRoleById(String roleId);

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId = #{roleId})")
    List<Permission> findOtherPermissions(String roleId) throws Exception;

    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId") String permissionId);
}
