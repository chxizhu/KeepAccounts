package business.impl;

import java.util.List;

import model.TUser;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.UserLoginDAO;

public class UserLoginDAImpl implements UserLoginDAO {

	private HibernateDAO bado = null;

	public UserLoginDAImpl() {
		this.bado = new HibernateDAOimpl();
	}
	
	/**
	 * �û���¼ҵ�񷽷� 
	 * Parameters: 
	 * userid �û���¼�� 
	 * password ��¼����
	 * TUser  ��ǰ��¼���û�����
	 */
	@Override
	public TUser UserLogin(String userid, Integer password) {
		String hql = " from TUser where uid = ? and password = ?";
		Object[] para = { userid, password };
		List list = bado.select(hql, para);
		if (list.size() > 0) {
			return (TUser) list.get(0);
		}

		else {
			return null;
		}
	}

}
