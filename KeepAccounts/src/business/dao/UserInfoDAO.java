package business.dao;

public interface UserInfoDAO {
	
	/**
	 * 修改用户信息
	 * @param userid 要修改的用户的用户名
	 * @param pwd 用户注册录密码的的
	 * @param username 用户注册的名字	
	 * @return 修改成功返回true 失败返回false
	 */
	public boolean modificationUserInfo(String userid,String username,int password); 	

}
