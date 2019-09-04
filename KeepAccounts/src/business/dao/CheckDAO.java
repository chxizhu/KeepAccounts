package business.dao;

import java.util.List;

import model.VUser;

public interface CheckDAO {
	
	/**
	 * 按照时间降序查询所有账单在首页显示
	 * @param String userid 当前用户
	 * @return  List<TFile>
	 */
	public List<VUser> queryCheck(String userid);
	
	/**
	 * 按照时间降序查询所有账单在首页显示总数
	 * @param String userid 当前用户
	 * @return  List<TFile>
	 */
	public int queryCheckCount(String userid);

}
