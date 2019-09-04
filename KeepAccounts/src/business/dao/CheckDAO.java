package business.dao;

import java.util.List;

import model.VUser;

public interface CheckDAO {
	
	/**
	 * ����ʱ�併���ѯ�����˵�����ҳ��ʾ
	 * @param String userid ��ǰ�û�
	 * @return  List<TFile>
	 */
	public List<VUser> queryCheck(String userid);
	
	/**
	 * ����ʱ�併���ѯ�����˵�����ҳ��ʾ����
	 * @param String userid ��ǰ�û�
	 * @return  List<TFile>
	 */
	public int queryCheckCount(String userid);

}
