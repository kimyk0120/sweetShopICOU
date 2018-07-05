package com.sweetk.scheduler.create.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.sweetk.scheduler.create.mapper.StatsSchedulerMapper;
import com.sweetk.web.admin.controller.ShopController;

public class StatsSchedulerController {
	Logger log = Logger.getLogger(ShopController.class);

	@Autowired
    private SqlSession sqlSession;

	public void createStats() {
		
		SimpleDateFormat sdfFile = new SimpleDateFormat("yyyy-MM-dd");

		long now = System.currentTimeMillis();
		String toDate = sdfFile.format(new Date(now));
		String statsDate = sdfFile.format(new Date(now- 3600*24*1000));

		//StatsSchedulerMapper mapper = sqlSession.getMapper(StatsSchedulerMapper.class);
		//mapper.shopCustomerDateResult(statsDate);
		sqlSession.insert("statsSchedulerMapper.shopCustomerDateResult",statsDate);
	}
}
