package com.itheima.service.impl;

import com.itheima.dao.IRoleDao;
import com.itheima.domain.Permission;
import com.itheima.domain.Role;
import com.itheima.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    public List<Role> findAll() throws Exception {
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }

    @Override
    public Role findById(String roleId) throws Exception {
        return roleDao.findById(roleId);
    }

    @Override
    public void deleteRoleById(String roleId) throws Exception {
        roleDao.deleteRoleFromUser_RoleByRoleId(roleId);
        roleDao.deleteRoleFromRole_PermissionByRoleId(roleId);
        roleDao.deleteRoleById(roleId);

    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) throws Exception {
        return roleDao.findOtherPermissions(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for (String permissionId: permissionIds) {
            roleDao.addPermissionToRole(roleId, permissionId);
        }
    }
}
