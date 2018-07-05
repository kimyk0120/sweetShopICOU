package com.sweetk.scheduler;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.sweetk.scheduler.create.controller.StatsSchedulerController;
import com.sweetk.scheduler.create.mapper.StatsSchedulerMapper;

@Component
public class StatsScheduler {

	static Logger log = Logger.getLogger(StatsScheduler.class);

	@Scheduled(cron = "0 32 18 * * *")
	public void statsCreate(){
		log.debug("############## Start Stats #################");
		System.out.println("############## Start Stats #################");

		SqlSessionFactory sqlSessionFactory = null;
		try {
			String resource = "com/sweetk/scheduler/mybatis-context.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			
			if (sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch(FileNotFoundException fileNotFoundException) {
			fileNotFoundException.printStackTrace();
		} catch(IOException ioException) {
			ioException.printStackTrace();
		}
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//StatsSchedulerController ssc = new StatsSchedulerController();
		//ssc.createStats();

		SimpleDateFormat sdfFile = new SimpleDateFormat("yyyy-MM-dd");

		long now = System.currentTimeMillis();
		String toDate = sdfFile.format(new Date(now));
		String statsDate = sdfFile.format(new Date(now- 3600*24*1000));

		//StatsSchedulerMapper mapper = sqlSession.getMapper(StatsSchedulerMapper.class);
		//mapper.shopCustomerDateResult(statsDate);
		sqlSession.insert("statsSchedulerMapper.shopCustomerDateResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopCustomerGenderAgeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopCustomerTimeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopEventDateResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopEventGenderAgeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopEventTimeResult",statsDate);
		sqlSession.commit();

		
		sqlSession.insert("statsSchedulerMapper.shopPromotionDateResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopPromotionGenderAgeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopPromotionTimeResult",statsDate);
		sqlSession.commit();


		sqlSession.insert("statsSchedulerMapper.shopReviewDateResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopReviewGenderAgeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopReviewVisitDateResult",statsDate);
		sqlSession.commit();

		sqlSession.insert("statsSchedulerMapper.shopReviewVisitTypeResult",statsDate);
		sqlSession.commit();
		
		sqlSession.insert("statsSchedulerMapper.shopReviewVisitDetailResult",statsDate);
		sqlSession.commit();
		
		sqlSession.close();
		
		log.debug("############## End Stats #################");
		System.out.println("############## End Stats #################");

	}

}
