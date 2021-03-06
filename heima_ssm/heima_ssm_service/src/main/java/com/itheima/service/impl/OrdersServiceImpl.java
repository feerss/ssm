package com.itheima.service.impl;

import com.github.pagehelper.PageHelper;
import com.itheima.dao.IOrdersDao;
import com.itheima.domain.Orders;
import com.itheima.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private IOrdersDao ordersDao;

    public List<Orders> findAll(int page,int size) throws Exception {
        //参数pageNum是页码值，pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return ordersDao.findAll();
    }


    public Orders findById(String ordersId) throws Exception {
        return ordersDao.findById(ordersId);
    }
}
