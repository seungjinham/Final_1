package com.iu.f1;

import static org.junit.Assert.assertNotNull;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iu.recruit.RecruitService;
import com.iu.scrap.ScrapDTO;
import com.iu.scrap.ScrapService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SqlTest {
	@Inject
	private SqlSession sqlSession;
	@Inject
	private RecruitService recruitService;
	
	@Test
	public void test() {
		System.out.println("sqlSession");
//		RecruitDTO recruitDTO = recruitService.selectOne(1);
//		System.out.println(recruitDTO.getId());
//		System.out.println(recruitDTO.getFname());
//		System.out.println(recruitDTO.getOname());
		
//		String[] arr = {"강남구", "서초구", "동작구"};
//		RecruitSearchDTO rs = new RecruitSearchDTO();
//		rs.setAddr(arr);
//		rs.setGender("male");
//		List<RecruitDTO> ar = recruitService.selectList(rs);
//		for(int i=0; i<ar.size(); i++) {
//			System.out.println(ar.get(i).getId());
//			System.out.println(ar.get(i).getFname());
//			System.out.println(ar.get(i).getOname());
//		}
		
		assertNotNull(sqlSession);

	}

}