
package business.dao;

import model.TUser;



public interface UserLoginDAO {

	/**
	 * �û���¼ҵ�񷽷�
	 * 
	 * @param userid �û���¼��
	 * @param password ��¼����
	 * @return TUser ��ǰ��¼���û�����
	 */
	public TUser UserLogin(String userid, Integer password);

	
}
