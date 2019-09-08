package business.dao;

import java.util.List;

import model.TBill;
import model.T_charts;


public interface GreetLoginDAO {
	/**
	 * 用户收入查询
	 * @param  TBill tb
	 * @return  List<TFile>
	 */
	public float income(TBill tb);
	
	/**
	 * 用户支出查询
	 * @param  TBill tb
	 * @return  List<TFile>
	 */
	public float expenditure(TBill tb);
	
	/**
	 * 用户支出查询
	 * @param  TBill tb
	 * @return  List<TFile>
	 */
	public List<T_charts> selectincome(TBill tb);
}
