package business.dao;

import java.util.List;

import model.VUserBill;

public interface AccountingDAO {

	/**
	 * 查询所有账单（收入与支出）
	 * @param userid当前登录用户ID
	 * @param currentPage 按分页查询的当前页
	 * @param pageSize 按分页查询的每页数量
	 * @return List<VUser>
	 */
	public List<VUserBill> getAccountList(String userid,int currentPage, int pageSize);
	
	/**
	 * 查询所有账单（收入与支出）的数量
	 * @param userid当前登录用户ID
	 * @param wherecondition 如："userRole = '超级管理员' and userid = 'zhangjs'"
	 * @return
	 */
	public int getAccountListAmount(String userid);
	
	/**
	 * 根据条件查询账单
	 * @param uid当前登录用户ID
	 * @param wherecondittion 查询条件
	 * @return list
	 */
	public List<VUserBill> getAccountListByCondition(String uid,String wherecondition,
			int currentPage, int pageSize);

	/**
	 * 根据条件查询查询账单总数
	 * 
	 * @param getSystemLog
	 * @return int
	 */
	public int getAccountListByConditionAmount(String userid,String wherecondition);
	
	/**
	 * 通过id进行删除账单
	 * @param int id
	 * @param
	 * @return 成功返回0 失败返回1
	 */
	public boolean deleteAccount(int id);

	
}
