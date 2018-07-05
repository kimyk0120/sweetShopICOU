package com.sweetk.web.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {
	public static String getDate(){
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		String mTime = mSimpleDateFormat.format ( currentTime );
		System.out.println ( mTime );

		return mTime;
	}

	public static String getDate(int day){
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date();
		Date diffDate = new Date ( currentTime.getTime ( ) - ((long) ( 1000 * 60 * 60 * 24 )*day) );
		String mTime = mSimpleDateFormat.format ( diffDate );
		System.out.println ( mTime );

		return mTime;
	}
}
