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
	 * 用户登录业务方法 
	 * Parameters: 
	 * userid 用户登录名 
	 * password 登录密码
	 * TUser  当前登录的用户对象
	 */
	@Override
	public TUser UserLogin(String userid, String password) {
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
