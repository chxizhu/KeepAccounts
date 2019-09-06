package business.impl;

import java.util.List;

import model.TBill;
import model.VUserBill;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.AddAccountDAO;

public class AddAccountDAOImpl implements AddAccountDAO {
	
	private HibernateDAO bado = null;

	public AddAccountDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}

	@Override
	public int addAccount(TBill bill) {
		Object obj = bado.insert(bill);
		if (obj != null)
			return 0;
		else
			return 1;	
	}

	@Override
	public boolean deletebill(String id) {
		return bado.delete(TBill.class, id);
	}
	
	@Override
	public List<VUserBill> getAccountList(String userid,int currentPage, int pageSize) {
		String hql = "from VUserBill where uid = ? order by billtime desc";
		Object[] para = {userid};
		List<VUserBill> list = bado.selectByPage(hql,para, currentPage, pageSize);
		return list;
	}

	@Override
	public int getAccountListAmount(String userid) {
		String hql = "select count(*) from VUserBill where uid =?";
		Object[] para = {userid};
		return bado.selectValue(hql,para);
	}
	
	@Override
	public boolean deleteAccount(int id) {
		// TODO Auto-generated method stub
		return bado.delete(TBill.class, id);		
	}

}
