package business.dao;

import model.TBill;

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
	
}
