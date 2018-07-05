package com.sweetk.web.admin.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {

	public ArrayList<HashMap<String, String>> notice_list(@Param("page_num") int page_num,
														 @Param("page_size") int page_size ,
														 @Param("notice_target") String notice_target ,
														 @Param("notice_title") String notice_title );

	public int notice_count(@Param("notice_target") String notice_target ,
						   @Param("notice_title") String notice_title);

	public HashMap<String, String> notice(int notice_seq);

	public void notice_update(@Param("notice_seq") String notice_seq ,
												 @Param("notice_target") String notice_target ,
												 @Param("notice_title") String notice_title ,
												 @Param("notice_comment") String notice_comment ,
												 @Param("notice_path") String notice_path ,
												 @Param("notice_org_name") String notice_org_name ,
												 @Param("notice_file") String notice_file);

	public void notice_insert(@Param("notice_target") String notice_target ,
												@Param("notice_title") String notice_title ,
												@Param("notice_comment") String notice_comment ,
												@Param("notice_path") String notice_path ,
												@Param("notice_org_name") String notice_org_name ,
												@Param("notice_file") String notice_file);
}
