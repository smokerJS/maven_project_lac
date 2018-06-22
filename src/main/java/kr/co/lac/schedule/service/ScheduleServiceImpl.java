package kr.co.lac.schedule.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lac.repository.domain.Event;
import kr.co.lac.repository.domain.Schedule;
import kr.co.lac.repository.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleMapper mapper;
	
	public Schedule[] selectSchedule(int userNo) throws Exception{
		return mapper.selectSchedule(userNo);
	}
		public List<Schedule> selectScheduleByMonth(Schedule schedule) throws Exception{
			return mapper.selectScheduleByMonth(schedule);
	}
	public void insertSchedule(Schedule schedule) throws Exception{
		mapper.insertSchedule(schedule);
	}
	public void updateSchedule(Schedule schedule) throws Exception{
		mapper.updateSchedule(schedule);
	}
	public void updateDateByDrag(Schedule schedule) throws Exception{
		mapper.updateDateByDrag(schedule);
	}
	public void deleteSchedule(int schNo) throws Exception{
		mapper.deleteSchedule(schNo);
	}
	public int selectIndex() throws Exception {
		return mapper.selectIndex();
	}
	public Schedule selectEventById(int schNo) throws Exception {
		return mapper.selectEventById(schNo);
	}
	
	
}
