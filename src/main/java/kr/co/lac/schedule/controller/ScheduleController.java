package kr.co.lac.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.lac.repository.domain.Event;
import kr.co.lac.repository.domain.Schedule;
import kr.co.lac.schedule.service.ScheduleService;

@Controller 
@RequestMapping("/schedule")
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;

	@RequestMapping("/schedule.do")
	private void schedule() {
	}

	@RequestMapping("/selectIndex.json")
	@ResponseBody
	public int selectIndex() throws Exception {
		return scheduleService.selectIndex();
	}

	@RequestMapping("/newSchedule.json")
	@ResponseBody
	public Schedule newSchedule(Schedule sch) throws Exception {
		String endDate = sch.getEndDate() + "T10:00:00";
		sch.setEndDate(endDate);
		// System.out.println(sch.getEndDate());
		// int endDate = Integer.parseInt(sch.getEndDate().substring(8))+1;
		// sch.setEndDate(sch.getEndDate().substring(0,8)+String.format("%02d",
		// endDate));
		// System.out.println(sch.getEndDate());
		scheduleService.insertSchedule(sch);
		return sch;
	}

	@RequestMapping("/selectSchedule.json")
	@ResponseBody
	public Event[] selectSchedule(int userNo) throws Exception {
		Event[] eArr = null;
		Schedule[] sArray = scheduleService.selectSchedule(userNo);
		// System.out.println(userNo);
		eArr = new Event[sArray.length];

		for (int i = 0; i < sArray.length; i++) {
			Schedule s = sArray[i];
			eArr[i] = new Event();
			eArr[i].setStart(s.getStartDate());
			eArr[i].setEnd(s.getEndDate());
			eArr[i].setTitle(s.getSchDetail());
			eArr[i].setBackgroundColor(s.getSchColor());
			eArr[i].setId(s.getSchNo());
			// System.out.println(eArr[0].getStart());
		}
		return eArr;
	}

	@RequestMapping("/deleteSchedule.json")
	@ResponseBody
	public Event[] deleteSchedule(int schNo) throws Exception {
		Event[] eArr = new Event[1];
		System.out.println(schNo);
		Schedule s = scheduleService.selectEventById(schNo);
		scheduleService.deleteSchedule(schNo);
		eArr[0] = new Event();
		System.out.println(s.getEndDate());
		eArr[0].setId(s.getSchNo());
		eArr[0].setStart(s.getStartDate());
		eArr[0].setEnd(s.getEndDate());
		eArr[0].setTitle(s.getSchDetail());
		eArr[0].setBackgroundColor(s.getSchColor());
		// eArr[0].setUrl("");
		return eArr;
	}

	@RequestMapping("/updateSchedule.json")
	@ResponseBody
	public void updateSchedule(Schedule schedule) throws Exception {
		if(schedule.getSchDetail().equals("")) {
//			System.out.println("디테일 값 없음");
			Schedule s = scheduleService.selectEventById(schedule.getSchNo());
			schedule.setSchDetail(s.getSchDetail());
		}
		System.out.println(schedule.getSchNo());
		schedule.setEndDate(schedule.getEndDate()+"T10:00:00");
		scheduleService.updateSchedule(schedule);
	}

	@RequestMapping("/updateScheduleDate.json")
	@ResponseBody
	public void updateScheduleDate(Schedule schedule, int delta) throws Exception {
//		schedule.getEndDate()[0]
//		schedule.setEndDate(schedule.getEndDate().substring(0, 10));
		String calStart = String.format("%02d", Integer.parseInt(schedule.getStartDate().substring(8, 10)) + delta);
		String start = schedule.getStartDate().substring(0, 8) + calStart;
		String calEnd = String.format("%02d", Integer.parseInt(schedule.getEndDate().substring(8, 10)));
		String end = schedule.getEndDate().substring(0, 8) + calEnd+"T10:00:00";

		System.out.println(start);
		System.out.println(end);
		schedule.setStartDate(start);
		schedule.setEndDate(end); 

		scheduleService.updateDateByDrag(schedule);
	}

	@RequestMapping("/selectScheduleByMonth.json")
	@ResponseBody
	public List<Schedule> selectScheduleByMonth(int month, int userNo) throws Exception {
		String eventMonth = String.format("%02d", month);
		Schedule s = new Schedule() {
		};
		s.setEventMonth(month);
		s.setUserNo(userNo);
		return scheduleService.selectScheduleByMonth(s);
	}

}
