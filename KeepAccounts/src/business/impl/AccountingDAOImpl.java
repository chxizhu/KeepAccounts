package business.impl;

import java.util.List;

import model.TBill;
import model.VUserBill;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.AccountingDAO;

public class AccountingDAOImpl implements AccountingDAO {

	private HibernateDAO bado = null;

	public AccountingDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}
	
	@Override
	public List<VUserBill> getAccountList(int currentPage, int pageSize) {
		String hql = "from VUserBill";
		List<VUserBill> list = bado.selectByPage(hql, currentPage, pageSize);
		return list;
	}

	@Override
	public int getAccountListAmount() {
		String hql = "select count(*) from VUserBill ";
		return bado.selectValue(hql);
	}

	@Override
	public List<VUserBill> getAccountListByCondition(String userid,String wherecondition,
			int currentPage, int pageSize) {
		String sql = " and uid = ? ";
		Object[] para = {userid};
		String hql = "from VUserBill";
		if (wherecondition != null && !wherecondition.equals("")) {
			hql += ( wherecondition + sql  ) ;
			System.out.println(hql);
		}
		/*List<VUserBill> list = bado.selectByPage(hql,para, currentPage, pageSize);

		return list;*/
		
		return bado.selectByPage(hql,para, currentPage, pageSize);
		
		
	}

	@Override
	public int getAccountListByConditionAmount(String userid,String wherecondition) {
		String sql = " and uid = ? ";
		Object[] para = {userid};
		String hql = "select count(*) from VUserBill";
		  if (wherecondition != null && !wherecondition.equals("")) {
		   hql += (wherecondition + sql) ;
		  
		  }
		  return  bado.selectValue(hql,para);
	}

	@Override
	public boolean deleteAccount(int id) {
		// TODO Auto-generated method stub
		return bado.delete(TBill.class, id);		
	}

}
