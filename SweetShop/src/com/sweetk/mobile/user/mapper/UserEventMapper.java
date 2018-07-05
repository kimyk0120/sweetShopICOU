package com.sweetk.mobile.user.mapper;

import com.sweetk.mobile.user.vo.UserEventVO;

public interface UserEventMapper {

	UserEventVO selectEventDetail(int eventSeq, double userLat, double userLong);

	UserEventVO selectEventDetail(int eventSeq, double userLat, double userLong, int userSeq);

	int eventDownCheckYN(int userSeq, int eventSeq);

	int eventUseCheckYN(int userSeq, int eventSeq);

	void insertEventViewCnt(int userSeq, int eventSeq);

	void insertEventUse(int userSeq, int eventSeq);
	
}
