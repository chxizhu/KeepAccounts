package business.impl;

import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.UserInfoDAO;

public class UserInfoDAOImpl implements UserInfoDAO {
	
private HibernateDAO bado = null;
	
	public UserInfoDAOImpl() {
		this.bado = new HibernateDAOimpl();
	}

	@Override
	public boolean modificationUserInfo(String userid, String username,
			int password) {
		String sql = "update T_User set uname=?,password=? where uid=?";
		Object[] param = {username,password,userid};
		return bado.update(sql, param);
	}

}
