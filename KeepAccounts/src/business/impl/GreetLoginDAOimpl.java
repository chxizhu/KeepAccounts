package business.impl;

import java.util.List;

import model.TBill;
import model.T_charts;
import model.VUserBill;
import business.basic.HibernateDAO;
import business.basic.HibernateDAOimpl;
import business.dao.GreetLoginDAO;

public class GreetLoginDAOimpl implements GreetLoginDAO {
	
	private HibernateDAO bado = null;

	public GreetLoginDAOimpl() {
		this.bado = new HibernateDAOimpl();
	}

	@Override
	public float income(TBill tb) {
		String hql = " select  SUM(money)  from T_Bill where  userid = ? AND operation =?";
		Object para[]={tb.getUserid(),"收入"};
		/*System.out.println(hql+para);*/
		float num = bado.selectValue(hql, para);
		return num;
	}

	@Override
	public float expenditure(TBill tb) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<T_charts> selectincome(TBill tb) {
		String sql = " Select  category,SUM(money)  AS money from T_Bill WHERE userid =? AND  operation =?  GROUP BY category ";
		Object para[]={tb.getUserid(),tb.getOperation()};
		/*System.out.println(sql+para);*/
		 List<T_charts> list =  bado.selectsql(sql, para);
		 return  list;
		 
	}

}
