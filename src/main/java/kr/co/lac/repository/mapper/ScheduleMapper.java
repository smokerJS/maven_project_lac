package kr.co.lac.repository.mapper;

import java.util.List;

import kr.co.lac.repository.domain.Schedule;

public interface ScheduleMapper {
	public Schedule[] selectSchedule(int userNo) throws Exception;
	public List<Schedule> selectScheduleByMonth(Schedule schedule) throws Exception;
	public void insertSchedule(Schedule schedule) throws Exception;
	public void updateSchedule(Schedule schedule) throws Exception;
	public void updateDateByDrag(Schedule schedule) throws Exception;
	public void deleteSchedule(int schNo)throws Exception;
	public int selectIndex()throws Exception;
	public Schedule selectEventById(int schNo)throws Exception;
}
