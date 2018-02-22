package com.iu.f1;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iu.company.CompanyService;
import com.iu.recruit.RecruitService;
import com.iu.scrap.ScrapDAO;
import com.iu.util.Districtcode;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class SqlTest {
	@Inject
	private SqlSession sqlSession;
	@Inject
	private RecruitService recruitService;
	@Inject
	private CompanyService companyService;
	@Inject
	private ScrapDAO scrapDAO;
	
	private List<Object> code = null;
	
	@Test
	public void test() {

	}

}