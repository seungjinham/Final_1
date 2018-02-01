package com.iu.f1;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iu.recruit.RecruitDTO;
import com.iu.recruit.RecruitService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SqlTest {
	@Inject
	private SqlSession sqlSession;
	@Inject
	private RecruitService recruitService;
	
	@Test
	public void test() {
		System.out.println(sqlSession);
		RecruitDTO recruitDTO = new RecruitDTO();
		recruitDTO.setTitle("test합니다");
		recruitDTO.setId("tool");
		recruitDTO.setPeople("1");
		recruitDTO.setGender("여자");
		recruitDTO.setAge("20~25");
		recruitDTO.setSchool("석사소지자");
		recruitDTO.setSpecial("정보보안기사");
		recruitDTO.setSalary("300");
		recruitDTO.setW_date("Null");
		recruitDTO.setW_day("Null");
		recruitDTO.setW_time("Null");
		recruitDTO.setJob("관리자");
		recruitDTO.setWork("관제");
		recruitDTO.setBenefit("Null");
		recruitDTO.setContents("개발");
		recruitDTO.setFname("Null");
		recruitDTO.setOname("Null");
		recruitDTO.setDeadline("2018-06-06");
		recruitService.update(recruitDTO);
	}

}