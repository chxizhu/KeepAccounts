package business.impl;

import model.TBill;
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

}
