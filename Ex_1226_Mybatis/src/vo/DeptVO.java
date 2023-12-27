package vo;

import java.util.List;

public class DeptVO {
	private int deptno;
	private String dname, loc;
	
	//부서별 사원목록을 저장할 List
	private List<SawonVO> sa_list;

	public List<SawonVO> getSa_list() {
		return sa_list;
	}
	public void setSa_list(List<SawonVO> sa_list) {
		this.sa_list = sa_list;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public List<SawonVO> getList() {
		return sa_list;
	}
	public void setList(List<SawonVO> list) {
		this.sa_list = list;
	}
}
