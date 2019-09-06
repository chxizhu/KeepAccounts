package business.dao;

import java.util.List;

import model.TBill;
import model.VUserBill;

public interface AddAccountDAO {

	/**
	 * 添加账单
	 * 
	 * @param TBill 账单对象
	 * @return 成功返回0失败返回1
	 */
	public int addAccount(TBill bill);
	
	/**
	 * 通过id进行删除账单
	 * 
	 * @param int id
	 * @param
	 * @return 成功返回0 失败返回1
	 */
	public boolean deletebill(String id);
	
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
	 * 通过id进行删除账单
	 * @param int id
	 * @param
	 * @return 成功返回0 失败返回1
	 */
	public boolean deleteAccount(int id);

	
}
