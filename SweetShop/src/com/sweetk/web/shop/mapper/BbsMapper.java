package com.sweetk.web.shop.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.sweetk.web.shop.vo.NoticeVo;
import com.sweetk.web.shop.vo.QnaVo;


public interface BbsMapper {

	public ArrayList<HashMap<String, String>> notice_list(@Param("page_num") int page_num,
															@Param("page_size") int page_size ,
															@Param("notice_title") String notice_title );

	public int notice_count(@Param("notice_title") String notice_title);

	public NoticeVo notice(String notice_seq);

	public HashMap<String, String> notice_prv(String notice_seq);

	public HashMap<String, String> notice_next(String notice_seq);

	public void notice_view_update(String notice_seq);

	public ArrayList<HashMap<String, String>> qna_list(@Param("page_num") int page_num,
														@Param("page_size") int page_size ,
														@Param("qna_comment") String qna_comment ,
														@Param("shop_seq") int shop_seq);

	public int qna_count(@Param("qna_comment") String qna_comment ,
							@Param("shop_seq") int shop_seq);

	public HashMap<String, String> qna(String qna_seq);

	public HashMap<String, String> qna_prv(@Param("qna_seq") int qna_seq ,
											@Param("qna_writer_seq") int qna_writer_seq);

	public HashMap<String, String> qna_next(@Param("qna_seq") int qna_seq ,
											@Param("qna_writer_seq") int qna_writer_seq);

	public HashMap<String, String> qna_answer(String qna_seq);

	public void qna_insert(QnaVo qv);

	public void qna_update(QnaVo qv);
}
