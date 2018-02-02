package com.iu.paper;

import java.util.List;

import com.iu.person.PersonDTO;

public class PaperDTO extends PersonDTO{ //이력서
	
	private String id; //회원ID
	private String fname; //자기사진 파일명
	private String oname; //자기사진 원본파일명
	private String army; //병역 여부
	private String marry; //결혼 여부
	private String hobby; //취미
	private String school; //학력
	private String major; //전공
	private List<CareerDTO> careerDTO; //경력
	private List<LicenseDTO> licenseDTO; //자격증
	private PortDTO portDTO; //포트폴리오
	private HopeDTO hopeDTO; //희망 근무조건
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public List<CareerDTO> getCareerDTO() {
		return careerDTO;
	}
	public void setCareerDTO(List<CareerDTO> careerDTO) {
		this.careerDTO = careerDTO;
	}
	public List<LicenseDTO> getLicenseDTO() {
		return licenseDTO;
	}
	public void setLicenseDTO(List<LicenseDTO> licenseDTO) {
		this.licenseDTO = licenseDTO;
	}
	public PortDTO getPortDTO() {
		return portDTO;
	}
	public void setPortDTO(PortDTO portDTO) {
		this.portDTO = portDTO;
	}
	public HopeDTO getHopeDTO() {
		return hopeDTO;
	}
	public void setHopeDTO(HopeDTO hopeDTO) {
		this.hopeDTO = hopeDTO;
	}
	
}
