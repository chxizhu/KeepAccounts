
package business.dao;

import model.TUser;



public interface UserLoginDAO {

	/**
	 *用户登录
	 * 
	 * @param userid 
	 * @param password 
	 * @return TUser 
	 */
	public TUser UserLogin(String userid, Integer password);

	
}
