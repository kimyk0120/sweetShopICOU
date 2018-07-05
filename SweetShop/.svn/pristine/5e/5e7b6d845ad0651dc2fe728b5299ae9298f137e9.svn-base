<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script>
/**
	모든차트는 (id, data, type) 파라미터를 받아 처리합니다

	id = 차트가 위치하는 div의 id,
	data = 차트의 데이터 array,
	type = 차트의 종류. type의 경우, 분기를 위해 처리하는 부분입니다.

	이렇게 세개의 파라미터를 받아서 처리하는것이 베이스이며,
	차트는 각 페이지의 차트유형별로 구분되어있습니다.

	각 차트의 디자인, 옵션등은 각페이지에 구현되어야합니다.
*/


//	컬럼차트 //////////////////////////////////////

	var nice_point=4.0;
	var bad_point=3.0;

	/**
		세부항목 별 평점 차트
		-nice, normal, bad 항목을 responseData로 반환
		-다른 차트와 달리 대부분의 옵션과 데이터가 이 위치에 다 있음

		사용페이지 :
			analy_review
		필수함수 :
			responseData()
	*/
	function drawDetailChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var data_chart = JSON.parse(data);
		var data_array = []
		data_array.push(["Element", "Density", {
			role : "style"
		}]);


		var nice_text="";
		var normal_text="";
		var bad_text="";
		len = data_chart.length;

		for (var i = 0; i < len; i++) {
			var obj = data_chart[i];

			if(nice_point < parseFloat(obj.grade)){
				data_array.push([obj.code_name, parseFloat(obj.grade), "#ff8500"]);
				if(nice_text != ""){
					nice_text +=",";
				}
				nice_text += obj.code_name;
			}else if(bad_point > parseFloat(obj.grade)){
				if(bad_text != ""){
					bad_text +=",";
				}
				data_array.push([obj.code_name, parseFloat(obj.grade), "#007aff"]);
				bad_text += obj.code_name;
			}else{
				data_array.push([obj.code_name, parseFloat(obj.grade), "#aaaaaa"]);
				normal_text += obj.code_name;
			}
		}

		responseData(type, nice_text, normal_text, bad_text, "");

		var data = google.visualization.arrayToDataTable(data_array);
		var view = new google.visualization.DataView(data);

		view.setColumns([ 0, 1, {
			calc : "stringify",
			sourceColumn : 1,
			type : "string",
			role : "annotation"
		}, 2 ]);

		var options = {
			bar : {
				groupWidth : "20%"
			},
			legend : {
				position : "none"
			},
		};
		var chart = new google.visualization.ColumnChart(document
				.getElementById(id));

		chart.draw(view, options);
	}

	//	라인차트 //////////////////////////////////////
	var timeChart_dt;
	var dateChart_dt;
	var pointChart_dt;
	var visitChart_dt;

	/**
		시간대별 우리가게 주변 고객수 평균 추이 차트 / 시간대별 이벤트 성과 추이 차트


		사용페이지 :
			analy_customer
			dashboard
			pr_event_index
			pr_handbill_index
		필수함수 :
			setColumnTimeChart()
			getChartTimeObject()
	*/
	function drawTimeChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var data_chart = JSON.parse(data);
		timeChart_dt = new google.visualization.DataTable();

		setColumnTimeChart();

		var arr = [];
		var len = data_chart.length;
		var obj = {};
		for (var i = 0; i < len; i++) {
			obj = data_chart[i];
			arr.push(getChartTimeObject(obj))
		}

		timeChart_dt.addRows(arr);

		var options = {
			legend : 'none',
			pointSize : 3,
			series : {
				0 : {
					color : '#aaaaaa'
				},
				1 : {
					color : '#ff8500'
				},
				2 : {
					color : '#007aff'
				}
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById(id));
		chart.draw(timeChart_dt, options);
	}

	//평점차트
	function drawPointChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var data_chart = JSON.parse(data.toString());
		pointChart_dt = new google.visualization.DataTable();

		setColumnPointChart();

		var arr = [];
		var len = data_chart.length;
		var obj = {};
		for (var i = 0; i < len; i++) {
			obj = data_chart[i];
			arr.push(getChartPointObject(obj))
		}

		pointChart_dt.addRows(arr);

		var options = {
			legend : 'none',
			pointSize : 3,
			series : {
				0 : {
					color : '#aaaaaa'
				},
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById(id));
		chart.draw(pointChart_dt, options);
	}

	//방문자 차트
	function drawVisitChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var data_chart = JSON.parse(data.toString());
		visitChart_dt = new google.visualization.DataTable();

		setColumnVisitChart();

		var maxNum = 0;
		var maxDate = "";

		var returnArray = new Array();
		var returnFlg = false;
		if (type.indexOf("special_") != -1) {
			returnFlg = true;
		}

		var arr = [];
		var len = data_chart.length;
		var obj = {};
		for (var i = 0; i < len; i++) {
			if (parseInt(obj.review_count) > maxNum) {
				maxNum = obj.review_count;
				maxDate = obj.rs_date;
			}

			obj = data_chart[i];
			arr.push(getChartVisitObject(obj))
		}

		visitChart_dt.addRows(arr);

		var options = {
			legend : 'none',
			pointSize : 3,
			series : {
				0 : {
					color : '#aaaaaa'
				},
			}
		};

		if (returnFlg) {
			responseData(type, maxDate, "", "");
		}

		var chart = new google.visualization.LineChart(document
				.getElementById(id));
		chart.draw(visitChart_dt, options);
	}

	/**
		요일별 고객수 평균 추이 차트 / 일별 이벤트 성과 추이 차트

		사용페이지 :
			analy_customer
			pr_event_index
			pr_handbill_index
		필수함수 :
			setColumnDateChart()
			getChartDateObject()
	*/
	function drawDateChart(id, data) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var date_chart = JSON.parse(data);
		dateChart_dt = new google.visualization.DataTable();

		setColumnDateChart();

		var arr = [];
		var len = date_chart.length;
		var obj = {};
		for (var i = 0; i < len; i++) {
			obj = date_chart[i];
			arr.push(getChartDateObject(obj));
		}

		var options = {
			legend : 'none',
			pointSize : 3,
			series : {
				0 : {
					color : '#aaaaaa'
				},
				1 : {
					color : '#ff8500'
				},
				2 : {
					color : '#007aff'
				}
			}
		};

		dateChart_dt.addRows(arr);
		var chart = new google.visualization.LineChart(document
				.getElementById(id));
		chart.draw(dateChart_dt, options);
	}

	//	파이차트 //////////////////////////////////////
	//성과 차트
	function drawEventPromotionChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var chart_data = JSON.parse(data);
		var count1 = chart_data.down_count;
		var count2 = chart_data.view_count;

		/*  		m_count = 20;
		 f_count = 33; */

		var returnArray = new Array();

		var data = google.visualization.arrayToDataTable([ [ ' ', ' ' ],
				[ '다운로드', count1 ], [ '열람', count2 ] ]);
		var str = count1+","+count2;


		var chart = new google.visualization.PieChart(document.getElementById(id));
		chart.draw(data, optionTypeChart(0, str, type));

	}


	/**
		이벤트열람-성별비율 차트 / 쿠폰다운로드-성별비율 차트 / 쿠폰사용-성별비율 차트 / 성별 리뷰 등록비율 차트(특정결과값 리턴)
		-일부 특정 차트에서 차트의 결과값을 반환받아 처리해야함으로 type구분을 잘 처리해야함

		사용페이지 :
			analy_customer
			analy_review
			pr_event_index
		필수함수 :
			optionTypeChart()
		조건필수함수(특정 결과값을 반환받아야하는 차트에서 사용됨) :
			responseData()

	*/
	function drawGenderChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var chart_data = JSON.parse(data);
		var m_count = chart_data.m;
		var f_count = chart_data.f;

		/*  		m_count = 20;
		 f_count = 33; */

		var returnArray = new Array();
		var returnStr = "";
		var returnFlg = false;
		if (type.indexOf("special_") != -1) {
			returnFlg = true;
		}

		var total = m_count + f_count;
		var data = google.visualization.arrayToDataTable([ [ ' ', ' ' ],
				[ '남성', m_count ], [ '여성', f_count ] ]);
		var str;
		var index;
		if (m_count > f_count) {
			str = "남성<br/>" + ((m_count / total) * 100).toFixed(1) + "%";
			index = 0;

			if (returnFlg) {
				returnArray.push("남성");
				returnArray.push(((m_count / total) * 100).toFixed(1));
				returnArray.push("여성");
				returnArray.push(((f_count / total) * 100).toFixed(1));

				responseData(type, returnArray[0], returnArray[1],
						returnArray[2], returnArray[3]);
			}
		} else {
			str = "여성<br/>" + ((f_count / total) * 100).toFixed(1) + "%";
			index = 1;

			if (returnFlg) {
				returnArray.push("여성");
				returnArray.push(((f_count / total) * 100).toFixed(1));
				returnArray.push("남성");
				returnArray.push(((m_count / total) * 100).toFixed(1));

				responseData(type, returnArray[0], returnArray[1],
						returnArray[2], returnArray[3]);
			}
		}

		var chart = new google.visualization.PieChart(document
				.getElementById(id));
		chart.draw(data, optionTypeChart(index, str, type));

	}

	/**
		방문유형별 리뷰 등록비율 차트(특정결과값 리턴)
		-일부 특정 차트에서 차트의 결과값을 반환받아 처리해야함으로 type구분을 잘 처리해야함

		사용페이지 :
			analy_customer
			analy_review
		필수함수 :
			optionTypeChart()
		조건필수함수(특정 결과값을 반환받아야하는 차트에서 사용됨) :
			responseData()

	*/
	function drawTypeChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}

		var chart_data = JSON.parse(data);
		var v01 = chart_data.v01;
		var v02 = chart_data.v02;
		var v03 = chart_data.v03;
		var v04 = chart_data.v04;
		var v05 = chart_data.v05;

		console.log(" ? " + chart_data.v01);

		var returnArray = new Array();
		var returnFlg = false;
		if (type.indexOf("special_") != -1) {
			returnFlg = true;
		}

		/* v01 = 5;
		v02 = 4;
		v03 = 3;
		v04 = 22;
		v05 = 1; */

		var total = v01 + v02 + v03 + v04 + v05;
		var data = google.visualization.arrayToDataTable([ [ ' ', ' ' ],
				[ '가족', v01 ], [ '친구', v02 ], [ '커플', v03 ], [ '비지니스', v04 ],
				[ '나홀로', v05 ] ]);
		var maxValue = Math.max(v01, v02, v03, v04, v05);
		var minValue = Math.min(v01, v02, v03, v04, v05);

		var str = "";
		var category = "";
		var value = "";
		var index = 0;

		if (maxValue == v01) {
			category = "가족";
			value = ((v01 / total) * 100).toFixed(1)
			index = 0;
		} else if (maxValue == v02) {
			category = "친구";
			value = ((v02 / total) * 100).toFixed(1)
			index = 1;
		} else if (maxValue == v03) {
			category = "커플";
			value = ((v03 / total) * 100).toFixed(1)
			index = 2;
		} else if (maxValue == v04) {
			category = "사업";
			value = ((v04 / total) * 100).toFixed(1)
			index = 3;
		} else if (maxValue == v05) {
			category = "나홀로";
			value = ((v05 / total) * 100).toFixed(1)
			index = 4;
		}

		str = category + "<br/>" + value + "%"

		if (returnFlg) {
			returnArray.push(category);
			returnArray.push(value);

			if (minValue == v01) {
				category = "가족";
				value = ((v01 / total) * 100).toFixed(1)
			} else if (minValue == v02) {
				category = "친구";
				value = ((v02 / total) * 100).toFixed(1)
			} else if (minValue == v03) {
				category = "커플";
				value = ((v03 / total) * 100).toFixed(1)
			} else if (minValue == v04) {
				category = "사업";
				value = ((v04 / total) * 100).toFixed(1)
			} else if (minValue == v05) {
				category = "나홀로";
				value = ((v05 / total) * 100).toFixed(1)
			}

			returnArray.push(category);
			returnArray.push(value);

			if (returnFlg) {
				responseData(type, returnArray[0], returnArray[1],
						returnArray[2], returnArray[3]);
			}
		}

		var chart = new google.visualization.PieChart(document
				.getElementById(id));
		chart.draw(data, optionTypeChart(index, str, type));

	}

	/**
		이벤트열람-연령별비율 차트 / 쿠폰다운로드-연령별비율 차트 / 쿠폰사용-연령별비율 차트/
		연령별 리뷰 등록비율 차트(특정결과값 리턴)
		-일부 특정 차트에서 차트의 결과값을 반환받아 처리해야함으로 type구분을 잘 처리해야함


		사용페이지 :
			analy_customer
			analy_review
			pr_event_index
		필수함수 :
			optionTypeChart()
		조건필수함수(특정 결과값을 반환받아야하는 차트에서 사용됨) :
			responseData()

	*/
	function drawAgeChart(id, data, type) {
		if(data == null){
			console.log("데이터가 없습니다");
			return;
		}
		var chart_data = JSON.parse(data);
		var y10_count = chart_data.Y10;
		var y20_count = chart_data.Y20;
		var y30_count = chart_data.Y30;
		var y40_count = chart_data.Y40;
		var y50_count = chart_data.Y50;
		var y60_count = chart_data.Y60;

		/* 		y10_count = 20;
		 y20_count = 10;
		 y30_count = 30;
		 y40_count = 10;
		 y50_count = 5;
		 y60_count = 25;
		 */

		var returnArray = new Array();
		var returnFlg = false;
		if (type.indexOf("special_") != -1) {
			returnFlg = true;
		}

		var total = y10_count + y20_count + y30_count + y40_count + y50_count
				+ y60_count;
		var data = google.visualization.arrayToDataTable([ [ ' ', ' ' ],
				[ '10대', y10_count ], [ '20대', y20_count ],
				[ '30대', y30_count ], [ '40대', y40_count ],
				[ '50대', y50_count ], [ '60대', y60_count ] ]);

		var maxValue = Math.max(y10_count, y20_count, y30_count, y40_count,
				y50_count, y60_count);

		var minValue = Math.min(y10_count, y20_count, y30_count, y40_count,
				y50_count, y60_count);
		var str = "";
		var category;
		var value;
		var index = 0;

		if (maxValue == y10_count) {
			category = "10대";
			value = ((y10_count / total) * 100).toFixed(1)
			index = 0;
		} else if (maxValue == y20_count) {
			category = "20대";
			value = ((y20_count / total) * 100).toFixed(1)
			index = 1;
		} else if (maxValue == y30_count) {
			category = "30대";
			value = ((y30_count / total) * 100).toFixed(1)
			index = 2;
		} else if (maxValue == y40_count) {
			category = "40대";
			value = ((y40_count / total) * 100).toFixed(1)
			index = 3;
		} else if (maxValue == y50_count) {
			category = "50대";
			value = ((y50_count / total) * 100).toFixed(1)
			index = 4;
		} else if (maxValue == y60_count) {
			category = "60대";
			value = ((y60_count / total) * 100).toFixed(1)
			index = 5;
		}
		str = category + "<br/>" + value + "%"

		if (returnFlg) {
			returnArray.push(category);
			returnArray.push(value);

			if (minValue == y10_count) {
				category = "10대";
				value = ((y10_count / total) * 100).toFixed(1)
			} else if (minValue == y20_count) {
				category = "20대";
				value = ((y20_count / total) * 100).toFixed(1)
			} else if (minValue == y30_count) {
				category = "30대";
				value = ((y30_count / total) * 100).toFixed(1)
			} else if (minValue == y40_count) {
				category = "40대";
				value = ((y40_count / total) * 100).toFixed(1)
			} else if (minValue == y50_count) {
				category = "50대";
				value = ((y50_count / total) * 100).toFixed(1)
			} else if (minValue == y60_count) {
				category = "60대";
				value = ((y60_count / total) * 100).toFixed(1)
			}

			returnArray.push(category);
			returnArray.push(value + "%");

			if (returnFlg) {
				responseData(type, returnArray[0], returnArray[1],
						returnArray[2], returnArray[3]);
			}
		}

		var chart = new google.visualization.PieChart(document
				.getElementById(id));
		chart.draw(data, optionTypeChart(index, str, type));

		console.log(str);
	}
</script>
