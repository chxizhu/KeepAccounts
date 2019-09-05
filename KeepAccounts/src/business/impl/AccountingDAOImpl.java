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
	public List<VUserBill> getAccountListByCondition(String wherecondition,
			int currentPage, int pageSize) {
		String hql = "from VUserBill";
		if (wherecondition != null && !wherecondition.equals("")) {
			hql += wherecondition;
			System.out.println(hql);
		}
		List<VUserBill> list = bado.selectByPage(hql, currentPage, pageSize);

		return list;
	}

	@Override
	public int getAccountListByConditionAmount(String wherecondition) {
		String hql = "Select count(*) from VUserBill";
		  if (wherecondition != null && !wherecondition.equals("")) {
		   hql += wherecondition;
		  
		  }
		  return  bado.selectValue(hql);
	}

	@Override
	public boolean deleteAccount(int id) {
		// TODO Auto-generated method stub
		return bado.delete(TBill.class, id);		
	}

}
