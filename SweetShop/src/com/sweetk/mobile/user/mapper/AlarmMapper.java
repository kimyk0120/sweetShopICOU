package com.sweetk.mobile.user.mapper;

import java.util.HashMap;

import com.sweetk.mobile.user.vo.AlarmVO;

public interface AlarmMapper {

	HashMap<String, AlarmVO> selectAlarmSetting(int seq);

	int allAlarmToZero(int seq);

	int allAlarmToOne(int seq);

	int alarmOneChange(AlarmVO vo);

	int selectAlarmUserYN(int seq);

	void insertUserToAlarm(int seq);

	int alarmOneChangeToTrue(AlarmVO vo);

	int selectAlarmYnCount(int seq);
		
}
