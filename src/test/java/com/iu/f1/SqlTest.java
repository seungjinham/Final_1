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
		recruitDTO.setTitle("test�մϴ�");
		recruitDTO.setId("tool");
		recruitDTO.setPeople("1");
		recruitDTO.setGender("����");
		recruitDTO.setAge("20~25");
		recruitDTO.setSchool("���������");
		recruitDTO.setSpecial("�������ȱ��");
		recruitDTO.setSalary("300");
		recruitDTO.setW_date("Null");
		recruitDTO.setW_day("Null");
		recruitDTO.setW_time("Null");
		recruitDTO.setJob("������");
		recruitDTO.setWork("����");
		recruitDTO.setBenefit("Null");
		recruitDTO.setContents("����");
		recruitDTO.setFname("Null");
		recruitDTO.setOname("Null");
		recruitDTO.setDeadline("2018-06-06");
		recruitService.update(recruitDTO);
	}

}