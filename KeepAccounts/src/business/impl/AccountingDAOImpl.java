package business.impl;

import java.util.List;

import model.VUser;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.AccountingDAO;

public class AccountingDAOImpl implements AccountingDAO {

	private HibernateDAO bado = null;

	public AccountingDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}
	
	@Override
	public List<VUser> getAccountList(int currentPage, int pageSize) {
		String hql = "from VUser";
		List<VUser> list = bado.selectByPage(hql, currentPage, pageSize);
		return list;
	}

	@Override
	public int getAccountListAmount() {
		String hql = "select count(*) from VUser ";
		return bado.selectValue(hql);
	}

	@Override
	public List<VUser> getAccountListByCondition(String wherecondition,
			int currentPage, int pageSize) {
		String hql = "from VUser";
		if (wherecondition != null && !wherecondition.equals("")) {
			hql += wherecondition;
			System.out.println(hql);
		}
		List<VUser> list = bado.selectByPage(hql, currentPage, pageSize);

		return list;
	}

	@Override
	public int getAccountListByConditionAmount(String wherecondition) {
		String hql = "Select count(*) from VUser";
		  if (wherecondition != null && !wherecondition.equals("")) {
		   hql += wherecondition;
		  
		  }
		  return  bado.selectValue(hql);
	}

	@Override
	public boolean deleteAccount(int id) {
		// TODO Auto-generated method stub
		//return bado.delete(TFile.class, id);
		return true;
	}

}
