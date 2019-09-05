package business.dao;

import java.util.List;
import model.TUser;
import model.VUser;

public interface RegisterDAO {
	/**
	 * 注册
	 * @param  TUser tr
	 * @return  List<TFile>
	 */
	public int addTUser(TUser tr);
}
