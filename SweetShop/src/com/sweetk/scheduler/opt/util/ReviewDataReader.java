package com.sweetk.scheduler.opt.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.log4j.Logger;

import com.sweetk.scheduler.opt.vo.OZoroVO;

public class ReviewDataReader {

	Logger log = Logger.getLogger(ReviewDataReader.class);

	int getInt(String str) {
		// System.out.println("str=>"+str);
		int n = 0;
		if (str != null)
			n = Integer.parseInt(str);
		return n;
	}

	float getFloat(String str) {
		// System.out.println("str=>"+str);
		float n = 0.0f;
		if (str != null)
			n = Float.parseFloat(str);
		return n;
	}

	int getGapDate(String prevDate) {
		int gap = 0;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(prevDate);
			Date endDate = formatter.parse("2000-01-01");

			// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
			long diff = beginDate.getTime() - endDate.getTime();
			gap = Math.round(diff / (24 * 60 * 60 * 1000));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return gap;
	}

	int getVisitType(String vt) {
		if (vt == null || "".equals(vt))
			return 0;
		if ("가족".equals(vt)) {
			return 1;
		} else if ("비즈니스".equals(vt)) {
			return 2;
		} else if ("커플".equals(vt)) {
			return 3;
		} else if ("친구".equals(vt)) {
			return 4;
		} else if ("나홀로".equals(vt)) {
			return 5;
		} else {
			return 6;
		}
	}

	public ArrayList<OZoroVO> readFile(String path, long startTime) {
		ArrayList<OZoroVO> data = new ArrayList<OZoroVO>();
		File f = new File(path);
		String fList[] = f.list();
		for(String fName : fList){
			if(fName.endsWith(".csv")){
				data = readCsvFile(data, path + File.separator + fName, startTime);
			}
		}
		return data;
	}

	public ArrayList<OZoroVO> readCsvFile(ArrayList<OZoroVO> data, String path, long startTime) {

		int row = 0;
		try {
			File csv = new File(path);
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(csv), "euc-kr"));
			String line = "";

			while ((line = br.readLine()) != null) {
				++row;
				// System.out.println("line=>"+line);
				if(line==null || line.indexOf(",")<1) continue;

				// -1 옵션은 마지막 "," 이후 빈 공백도 읽기 위한 옵션
				String[] token = line.split(",", -1);
				// ReviewVO vo = new ReviewVO();
				// int colNum = -1;
				// 사용자순차번호,매장순차번호,시간,리뷰점수,방문 유형,방문 시기,리뷰 제목,리뷰 내용,서비스 점수,맛 점수,가격 점수,청결도 점수,시설 점수,위치 점수,성별,생년
				// vo.setUserSeq(getInt(token[++colNum]));
				// vo.setShopSeq(getInt(token[++colNum]));
				// vo.setReviewDate(token[++colNum]);
				// vo.setReviewGrade(getFloat(token[++colNum]));
				// vo.setReviewVisitType(token[++colNum]);
				// vo.setReviewVisitDate(token[++colNum]);
				// vo.setReviewTitle(token[++colNum]);
				// vo.setReviewComment(token[++colNum]);
				// vo.setReviewDetailGrade1(getFloat(token[++colNum]));
				// vo.setReviewDetailGrade2(getFloat(token[++colNum]));
				// vo.setReviewDetailGrade3(getFloat(token[++colNum]));
				// vo.setReviewDetailGrade4(getFloat(token[++colNum]));
				// vo.setReviewDetailGrade5(getFloat(token[++colNum]));
				// vo.setReviewDetailGrade6(getFloat(token[++colNum]));
				// vo.setWriterGender(token[++colNum]);
				// vo.setWriterYear(token[++colNum]);

				OZoroVO vo = new OZoroVO();
				vo.setO_shop_idx(getInt(token[1]));
				vo.setO_user_idx(getInt(token[0]));
				vo.setScore(getFloat(token[3]));
				vo.setVisit_type(getVisitType(token[4]));
				vo.setWrite_date(getGapDate(token[5]));

				// CSV에서 읽어 배열에 옮긴 자료 확인하기 위한 출력
				// System.out.println("["+row+"]"+vo.toString());

				data.add(vo);
			}
			br.close();
			csv.renameTo(new File(csv.getAbsoluteFile()+".bak"));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("=============[File Read("+row+")] end time(Millisecond) : " + System.currentTimeMillis() + ", Lead time(Millisecond) : "
				+ (System.currentTimeMillis() - startTime));
		return data;
	}
}
