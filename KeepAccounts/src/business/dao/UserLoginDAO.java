package business.dao;

import model.TUser;



public interface UserLoginDAO {

	/**
	 * 用户登录业务方法
	 * 
	 * @param userid 用户登录名
	 * @param password 登录密码
	 * @return TUser 当前登录的用户对象
	 */
	public TUser UserLogin(String userid, String password);

	
}
