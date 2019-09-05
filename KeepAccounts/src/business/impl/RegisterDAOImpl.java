package business.impl;

import model.TUser;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.RegisterDAO;

public class RegisterDAOImpl implements RegisterDAO {
	private HibernateDAO bado = null;
	
	public RegisterDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}

	@Override
	public int addTUser(TUser tr) {
		Object obj = bado.insert(tr);
		if(obj != null){
			return 0;
		}
		else{
			return 1;
		}	 
	}

}
