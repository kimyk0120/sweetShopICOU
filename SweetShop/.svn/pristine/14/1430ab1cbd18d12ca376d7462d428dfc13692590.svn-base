package com.sweetk.scheduler.opt.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.sweetk.scheduler.opt.mapper.IcouCoreMapper;
import com.sweetk.scheduler.opt.util.ReviewDataReader;
import com.sweetk.scheduler.opt.vo.OZoroVO;
import com.sweetk.scheduler.opt.vo.ShopTypeVO;
/*
 * SELECT * FROM HINT.O_ZORO 에 CSV 파일을 넣는다(REVIEW테이블과 별도로 만들어도 되고 )

o_reviews_idx
o_shop_idx
o_user_idx
score--
o_user_review_count--전체샵에대한 리뷰카운트
write_date--특정년 기준으로 떨어진 일

기존테이블에 아래 컬럼추가 하여도 됨
o_user_review_count--전체샵에대한 리뷰카운트
write_date--특정년 기준으로 떨어진 일


O_SCORE_AGG 테이블은 생성해야 함
SELECT * FROM HINT.O_SCORE_AGG -- O_AVG 최적집계를 통하여 나온 점수

c1~C5 : VISIT_TYPE
가족
비즈니스
커플
친구
나홀로

O_REVIEWS 에는 O_ZORO 에 넣을 데이터가 이미 있어야 함

select_user_char, select_hotel_char 는 아이쿠 테이블로 변경
 */
@Component
public class IcouOptScheduler {
    Logger log = Logger.getLogger(IcouOptScheduler.class);
    
    @Autowired
    private SqlSession sqlSession;
    
    @Autowired
    private SqlSessionFactoryBean sqlSessionFactory;
    
    @Autowired
    private PlatformTransactionManager transactionManager;
    
    @Scheduled(cron = "0 0 * * * *")
    public void run() {
    	//ModelAndView mav = new ModelAndView("index");
    	long startTime = System.currentTimeMillis();
    	long prevTime = System.currentTimeMillis();
    	System.out.println("============[start] time(Millisecond) : " + startTime);
    	IcouCoreMapper mapper = sqlSession.getMapper(IcouCoreMapper.class);
        
    	//String path = "C:\\23.Project\\14.Icou\\31.Data";//\\Review_Register_DATA.csv
    	//String path = "C:\\Program Files\\Testing\\Data";//\\Review_Register_DATA.csv
    	String path = "/home/tta/icoudata";//\\Review_Register_DATA.csv
		ReviewDataReader reader = new ReviewDataReader();
		ArrayList<OZoroVO> zoro_list = reader.readFile(path, startTime);
    	System.out.println("============[end - file read(count : "+(zoro_list.size())+")] time(Millisecond) : " + System.currentTimeMillis() + ", Step1 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
    	prevTime = System.currentTimeMillis();
		if(zoro_list==null || zoro_list.size()<1){
	        System.out.println("============[end] time(Millisecond) : " + System.currentTimeMillis() + ", Lead time(Millisecond) : " + (System.currentTimeMillis()-startTime));
	        return;
		}

        ArrayList<ShopTypeVO> hotel_type_list = null;
        ArrayList<ShopTypeVO> user_type_list = null;
        
        try {
        	// ####################################################################################################
        	// ####################################### MAKE_DATA ##################################################
        	// ####################################################################################################
        	
        	// ############# P1 ~ P4. Process in insert_opt_data #######################################
        	//int shop_cnt = mapper.select_rated_shop_count();
        	ArrayList<OZoroVO> tList = new ArrayList<OZoroVO>();
        	Map<String, Object> map = new HashMap<String, Object>();
        	for(int i=0; i<zoro_list.size(); ++i){
        		tList.add(zoro_list.get(i));
        		if(i%200==199){
                	map.put("list", tList);
                	mapper.insert_zoro(map);
                	tList.clear();
                	map.clear();
        		}
        	}
        	if(tList!=null && tList.size()>0){
            	map.put("list", tList);
            	mapper.insert_zoro(map);
        	}
        	System.out.println("============[end - insert zoro(count : "+(zoro_list.size())+")] time(Millisecond) : " + System.currentTimeMillis() + ", Step2 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        	prevTime = System.currentTimeMillis();
        	
        	mapper.insert_opt_data();
        	System.out.println("============[end - insert_opt_data] time(Millisecond) : " + System.currentTimeMillis() + ", Step3 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        	prevTime = System.currentTimeMillis();

        	// ############# P5. Process MatchD_r #######################################
        	// TODO 1. Make Shop character Matrix  = hotel_type_list
        	hotel_type_list = mapper.select_hotel_char();
        	
        	// TODO 2. Make Reviewer character Matrix = user_type_list
        	user_type_list = mapper.select_user_char();
        	
        	// TODO 3. Make MatchD_r = match_char_list
        	for (int i = 0; i < hotel_type_list.size(); i ++) {
        		ShopTypeVO tmp_shop_vo = hotel_type_list.get(i);
        		
        		ShopTypeVO tmp_user_vo = null;
        		double match_d = 0;
        		for(int j = 0; j < user_type_list.size() ; j++) {
        			tmp_user_vo = user_type_list.get(j);
        			
        			// ******* Calculate matching distance ******
        			match_d = match_d + Math.pow((tmp_shop_vo.getC1()-tmp_user_vo.getC1()),2);
        			match_d = match_d + Math.pow((tmp_shop_vo.getC2()-tmp_user_vo.getC2()),2);
        			match_d = match_d + Math.pow((tmp_shop_vo.getC3()-tmp_user_vo.getC3()),2);
        			match_d = match_d + Math.pow((tmp_shop_vo.getC4()-tmp_user_vo.getC4()),2);
        			match_d = match_d + Math.pow((tmp_shop_vo.getC5()-tmp_user_vo.getC5()),2);
        			
        			// System.out.println(""+tmp_shop_vo.getO_shop_idx()+"\t|"+tmp_user_vo.getO_user_idx()+"\t|"+(float)match_d);
        			tmp_user_vo.setO_shop_idx(tmp_shop_vo.getO_shop_idx());
        			tmp_user_vo.setMatch_d((float)match_d);
        			
        			// ******* Update matching distance to DB ******
        			mapper.update_matching_distance(tmp_user_vo);
        		}
        	}
        	System.out.println("============[end - update_matching_distance] time(Millisecond) : " + System.currentTimeMillis() + ", Step4 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        	prevTime = System.currentTimeMillis();

        	
        	// ############# P6. Process Taste Variety = shop_char_list #######################################
        	ArrayList<ShopTypeVO> user_taste_list = mapper.select_user_taste();
        	for(int i = 0 ; i < user_taste_list.size() ; i++) {
        		ShopTypeVO tmp_vo = user_taste_list.get(i);
        		
        		// ******* Update Taste variety to DB ******
    			mapper.update_user_taste(tmp_vo);
        	}
        	System.out.println("============[end - update_user_taste] time(Millisecond) : " + System.currentTimeMillis() + ", Step5 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        	prevTime = System.currentTimeMillis();

        	// ####################################################################################################
        	// ####################################### OPT_AVG ####################################################
        	// ####################################################################################################
        	int new_sig, new_rho, mu_change;

        	int nr = zoro_list.size();//mapper.select_agg_data_count();
        	ArrayList<Integer> xIdx = mapper.select_reviews_idx();
        	ArrayList<Integer> xr = mapper.select_reviews_score();
        	
        	//System.out.println("============[agg_data_count :" + nr + "], [hotel_type_count :" + hotel_type_list.size() + "], [user_taste_count :" + user_taste_list.size() + "]");
            
        	new_sig = 0;
        	new_rho = 0;
        	mu_change = -1;
        	
        	mapper.update_age_mth(ShopTypeVO.PERIOD);
        	System.out.println("============[end - update_age_mth] time(Millisecond) : " + System.currentTimeMillis() + ", Step6 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        	prevTime = System.currentTimeMillis();

        	
        	// ############# Generation of Lambda #######################################
        	double    lamne0 = 0;
        	double lamne_day = ShopTypeVO.est[7];
        	double   lamne_m = ShopTypeVO.est[8];
        	double  lamne_mv = ShopTypeVO.est[9];
        	double  lamne_fq = ShopTypeVO.est[10];
        	double lamne_his = ShopTypeVO.est[11];

        	double   lame0 = ShopTypeVO.est[6];
        	double lame_day = ShopTypeVO.est[12] +ShopTypeVO.est[7];
        	double   lame_m = ShopTypeVO.est[13] +ShopTypeVO.est[8];
        	double  lame_mv = ShopTypeVO.est[14] +ShopTypeVO.est[9];
        	double  lame_fq = ShopTypeVO.est[15]+ShopTypeVO.est[10]; 
        	double lame_his = ShopTypeVO.est[16]+ShopTypeVO.est[11];
        	
        	double var_e = 0;
        	double var_ne = 0;
        	double var_mu[] = new double[nr];
        	
        	double rho_e = 0;
        	double rho_ne = 0;
        	
        	// ******** UNKNOWN VAR ********************
        	double sig_e = 0;
        	double sig_ne = 0;
        	double sig_mu = 0;
        	double ro_e = 0;
        	double ro_ne = 0;
        	// ******** UNKNOWN VAR ********************
        	
        	double Eli[] = new double[nr];
        	double Var[] = new double[nr];
        	double Rho[] = new double[nr];
        	double Lame[] = new double[nr];
        	double Lamne[] = new double[nr];
        	double Lam[] = new double[nr];
        	double Ageday[] = new double[nr];
        	double match[] = new double[nr];
        	double matchvar[] = new double[nr];
        	double rev_freq[] = new double[nr];
        	double Hist[] = new double[nr];
        	double Ageqe[] = new double[nr];
        	double Ageqne[] = new double[nr];
        	double Ageq[] = new double[nr];
        	
        	if (new_sig==0) {
        	  var_e = ShopTypeVO.est[1] * ShopTypeVO.est[1];             
        	  var_ne = ShopTypeVO.est[2] * ShopTypeVO.est[2];
        	  for(int i = 0 ; i < nr ; i++) {
        		  var_mu[i] = ShopTypeVO.est[5] * ShopTypeVO.est[5]; 
        	  }
        	} else if (new_sig==1) {
        	  var_e = (sig_e*sig_e);
        	  var_ne = (sig_ne*sig_ne);
        	  for(int i = 0 ; i < nr ; i++) {
        		  var_mu[i] = (sig_mu*sig_mu);
        	  }
        	}

        	if (mu_change==0) var_mu = new double[nr];

        	if (new_rho==0) {
        		rho_e = 2/(1 + Math.exp(-ShopTypeVO.est[3]))-1;
        		rho_ne = 2/(1 + Math.exp(-ShopTypeVO.est[4]))-1;
        	} else if (new_rho==1) {
        		rho_e = ro_e;
        		rho_ne = ro_ne;
        	}
        	
        	
        	// ########## first difference in number of mths
        	ArrayList<Double> Agemth = mapper.select_agemth();
        	
        	double Agemth_f1[] = new double[nr];
        	double dAgemth[] =  new double[nr];
        	
        	for(int i = 0 ; i < nr ; i++) {
	        	Var[i] = Eli[i]*var_e+(1-Eli[i])*var_ne;
	        	Rho[i] = Eli[i]*rho_e+(1-Eli[i])*rho_ne;
	
	
	        	Lame[i] = lame0+Ageday[i]*lame_day+match[i]*lame_m+matchvar[i]*lame_mv+rev_freq[i]*lame_fq + Hist[i]*lame_his;
	        	Lamne[i] = lamne0+Ageday[i]*lamne_day+match[i]*lamne_m+matchvar[i]*lamne_mv +rev_freq[i]*lamne_fq + Hist[i]*lamne_his;
	
	        	Lam[i] = Eli[i]*Lame[i]+(1-Eli[i])*Lamne[i];
	
	
	        	Ageqe[i] = Ageday[i]*lame_day;
	        	Ageqne[i] = Ageday[i]*lamne_day; 
	        	Ageq[i] = Eli[i]*Ageqe[i] + (1-Eli[i])*Ageqne[i]; 
	        	
	        	if(i < nr-1) {
	        		Agemth_f1[i] = Agemth.get(i+1).doubleValue();
	        		dAgemth[i] = Agemth.get(i+1).doubleValue() - Agemth.get(i).doubleValue();
	        	}
	        	if(dAgemth[i]<0) dAgemth[i] = 0;
        	}
        	
        	Agemth_f1[nr-1] = 1;
        	dAgemth[nr-1] = 1 - Agemth.get(nr-1).doubleValue();
        	if(dAgemth[nr-1]<0) dAgemth[nr-1] = 0;

        	// ########## 3. Back out signals
        	double S[] = new double[nr];
        	double Mur[] = new double[nr];

        	S[0] = xr.get(0).intValue()-Lam[0];
        	double mu = S[0];      // I changed this part!!!
        	Mur[0]= S[0];
        	double var = Var[0]+dAgemth[0]*var_mu[0];   
        	
        	
        	double mu_pr = 0;
        	double var_pr = 0;
        	double var_i = 0;
        	double A = 0;
        	double B = 0;
        	double C = 0;
        	
        	for(int i = 1 ; i < nr ; i++) {
        	         mu_pr = mu;
        	        var_pr = var;
        	         var_i = Var[i-1];                // I changed this part
        	             A = var_i/(var_pr+var_i);
        	             B = var_pr/(var_pr+var_i);
        	             C = 1/(1-(1-B)*Rho[i]);
        	          S[i] = C*(xr.get(i-1).intValue()-Lam[i-1]-Rho[i-1]*A*mu_pr);   // this is the original code
        	            mu = A*mu_pr+B*S[i-1];                          // I changed this part!!!
        	        Mur[i] = A*mu_pr+B*S[i-1];
        	           var = dAgemth[i-1]*var_mu[i-1]+var_pr*var_i/(var_pr+var_i);  
        	}
        	
        	update_oa( nr, Mur, xIdx);
        	/*for(int i = 0 ; i < nr ; i++) {
        		mapper.update_oa(Mur[i], xIdx.get(i).intValue());
        		if(i%200==199){
        			System.out.println("============[end]xIdx.get(i).intValue()=>"+xIdx.get(i).intValue()+", Mur[i]=>"+Mur[i]);
        			System.out.println("============[end - update_oa("+i+")] time(Millisecond) : " + System.currentTimeMillis() + ", Step7 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        			prevTime = System.currentTimeMillis();
        		}
        	}*/

/*        	SqlSession batchSession = sqlSessionFactory.getObject().openSession(ExecutorType.BATCH);
            try {
            	IcouCoreMapper batchMapper = batchSession.getMapper(IcouCoreMapper.class);
            	for(int i = 0 ; i < nr ; i++) {
//            		OZoroVO vo = new OZoroVO();
//            		vo.setO_reviews_idx(xIdx.get(i).intValue());
//            		vo.setO_avg(Mur[i]);
//            		tList.add(vo);
            		batchMapper.update_oa(Mur[i], xIdx.get(i).intValue());
            		if(i%200==199){
//            			map.put("list", tList);
//            			batchMapper.update_oa(map);
            			batchSession.commit();
            			System.out.println("============[end]xIdx.get(i).intValue()=>"+xIdx.get(i).intValue()+", Mur[i]=>"+Mur[i]);
            			System.out.println("============[end - update_oa("+i+")] time(Millisecond) : " + System.currentTimeMillis() + ", Step7 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
						prevTime = System.currentTimeMillis();
            		}
            	}
            	batchSession.commit();
            } finally {
            	batchSession.close();
            }*/

        } catch (Exception e) {
        	e.printStackTrace();
        }
    	System.out.println("============[end] time(Millisecond) : " + System.currentTimeMillis() + ", Step7 : " + (System.currentTimeMillis()-prevTime) + ", Total : " + (System.currentTimeMillis()-startTime));
        //return mav;
    }
    
    public void update_oa(int nr, double[] Mur, ArrayList<Integer> xIdx){
    	Connection conn = null;
    	PreparedStatement stmt = null;
    	long prevTime = System.currentTimeMillis();
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection("jdbc:mysql://hint.c4w4eqizqhcz.us-west-2.rds.amazonaws.com:3306/icou?useUnicode=yes&characterEncoding=utf-8&autoReconnect=true", "sweetk", "sweet1004hint");

    		String sql = "UPDATE O_SCORE_AGG SET O_AVG = ? WHERE O_REVIEWS_IDX = ?";
    		stmt = conn.prepareStatement(sql);
    		
    		for(int i = 0 ; i < nr ; i++) {
        		if(i%10==9){
        			stmt.setDouble(1, Mur[i]);
        			stmt.setInt(2, xIdx.get(i).intValue());
        			stmt.addBatch();
        		}
        		if(i%3000==2999){
			        stmt.executeBatch();
			        stmt.clearBatch();
        			System.out.println("============[end - update_oa("+i+")] time(Millisecond) : " + System.currentTimeMillis() + ", Step7 : " + (System.currentTimeMillis()-prevTime));
        		}
        		stmt.clearParameters();
        	}
    		stmt.executeBatch();
   		} catch (ClassNotFoundException e) {
   			e.printStackTrace();
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}finally {
   			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    }
}
