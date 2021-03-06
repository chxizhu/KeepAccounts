package business.impl;

import java.util.List;

import model.VUserBill;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.CheckDAO;

public class CheckDAOImpl implements CheckDAO {

	private HibernateDAO bado = null;

	public CheckDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}
	
	@Override
	public List<VUserBill> queryCheck(String userid) {
		String hql =  "from VUserBill o where userid = ?  order by uptime desc";
		Object[] para = {userid};
		return bado.select(hql, para);
	}
	
	@Override
	public int queryCheckCount(String userid) {
		String hql =  "select count(*) from VUserBill o where userid = ?  ";
		Object[] para = {userid};
		return bado.selectValue(hql, para);
	}

}
