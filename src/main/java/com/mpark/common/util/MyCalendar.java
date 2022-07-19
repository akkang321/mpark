package com.mpark.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;

@Controller
public class MyCalendar {
    static MyCalendar myCalendar = new MyCalendar();
    
    public String getToday() {
    	Date currentTime = new Date();
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    	String today = formatter.format(currentTime);
    	return today;
    }
    
    public String getYear() {
    	Date currentTime = new Date();
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
    	String year = formatter.format(currentTime);
    	return year;
    }
    
    public String getMonth() {
    	Date currentTime = new Date();
    	SimpleDateFormat formatter = new SimpleDateFormat("MM");
    	String month = formatter.format(currentTime);
    	return month;
    }
    
    public String getDay() {
    	Date currentTime = new Date();
    	SimpleDateFormat formatter = new SimpleDateFormat("dd");
    	String day = formatter.format(currentTime);
    	return day;
    }
    
    public int[] getCurrent() {
        Calendar calendar = Calendar.getInstance();
        int currentYear = calendar.get(Calendar.YEAR);
        int currentMonth = calendar.get(Calendar.MONTH) + 1;
        int[] currentYearMonth = {currentYear, currentMonth};
        return currentYearMonth;
    }

    public boolean isLeapYear(int year) {
        if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
            return true;
        else
            return false;
    }

    public int calMonth1stDayWeek(int year, int month) {
        Calendar calendar = Calendar.getInstance();
        String YMD = year + "-" + month + "-01";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            calendar.setTime(formatter.parse(YMD));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int dayNum = calendar.get(Calendar.DAY_OF_WEEK);
        // 1(일) 2(월) 3(화) 4(수) 5(목) 6(금) 7(토)
        return dayNum;
    }
    
    public Map<String, Object> calendarInfo(String sYear, String sMonth, String addMonth){
    	int year = Integer.parseInt(sYear);
    	int month = Integer.parseInt(sMonth);
    	
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
    	Date date;
    	Calendar cal = Calendar.getInstance();
    	
		try {
			date = sdf.parse(sYear+sMonth);
			cal.setTime(date);
			cal.add ( cal.MONTH,Integer.parseInt(addMonth));
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH)+1;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return makeCanlendar(year, month);
    }
    
    
    public Map<String, Object> calendarInfo() {
        int year = myCalendar.getCurrent()[0];
        int month = myCalendar.getCurrent()[1];
        return makeCanlendar(year, month);
    }
    
    public Map<String, Object>  makeCanlendar(int year, int month) {
    	 int dayMax = 0;
         int[] dayData = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
         int[] dayDataLeapYear = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
         boolean leapTest = isLeapYear(year);
         if (month == 2 && leapTest == true) { //2월이고 윤년
             dayMax = dayDataLeapYear[month - 1];
         }
         if (month == 2 && leapTest == false) { //2월이지만 윤년X
             dayMax = dayData[month - 1];
         }
         if (month != 2) { // 2월 아님
             dayMax = dayData[month - 1];
         }
         // 3. 월의 1일의 요일 계산
         int dayWeek1 = calMonth1stDayWeek(year, month); // 현재 월의 1일의 요일
         // 4. 달력 형태로 출력 - printCalendar
         Map<String, Object> calendarInfo = new HashMap<String, Object>();
         ArrayList<Object> dayList = new ArrayList<>();
         for (int j=1; j<dayWeek1; j++) {
         	dayList.add("");
         }
         for (int i = 1; i <= dayMax; i++) {
         	dayList.add(i);
         }
         if (dayList.size() %7 != 0) {
         	for (int i=0; i< dayList.size() %7; i++) {
         		dayList.add("");
         	}
         }
         
         String strMonth = month+"";
        if (month < 10 ) {
        	strMonth = "0"+month;
        }
         
         
        calendarInfo.put("year", year);
        calendarInfo.put("month", strMonth);
        calendarInfo.put("dayList", dayList);
        
        calendarInfo.put("nowYear", getYear());
        calendarInfo.put("nowMonth", getMonth());
        calendarInfo.put("nowDay", Integer.parseInt(getDay()));
        
        return calendarInfo;
    }

}
