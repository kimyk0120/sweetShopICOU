package com.sweetk.web.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface QnaMapper {

	public ArrayList<HashMap<String, String>> qna_list(@Param("page_num") int page_num,
														 @Param("page_size") int page_size ,
														 @Param("qna_title") String qna_title ,
														 @Param("qna_writer") String qna_writer ,
														 @Param("qna_target") String qna_target ,
														 @Param("qna_status") String qna_status ,
														 @Param("qna_type") String qna_type ,
														 @Param("start_date") String start_date ,
														 @Param("end_date") String end_date);

	public int qna_count(@Param("qna_title") String qna_title ,
						 @Param("qna_writer") String qna_writer ,
						 @Param("qna_target") String qna_target ,
						 @Param("qna_status") String qna_status ,
						 @Param("qna_type") String qna_type ,
						 @Param("start_date") String start_date ,
						 @Param("end_date") String end_date);

	public HashMap<String, String> qna(String qna_seq);

	public HashMap<String, String> qna_prv(@Param("qna_seq") int qna_seq);

	public HashMap<String, String> qna_next(@Param("qna_seq") int qna_seq);

	public HashMap<String, String> qna_answer(String qna_seq);

	public void qna_insert(@Param("top_qna_seq") String top_qna_seq ,
												@Param("qna_title") String qna_title ,
												@Param("qna_comment") String qna_comment);

	public void qna_update(@Param("qna_seq") int qna_seq,@Param("qna_comment") String qna_comment);

	public void qna_status_update(@Param("qna_seq") int qna_seq,@Param("qna_status") String qna_status);
}
