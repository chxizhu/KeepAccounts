package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.VUserBill;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.AccountingDAO;
import business.impl.AccountingDAOImpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/accountingmodel")

public class AccountingController {
	
	 //加载表格
		@RequestMapping(value = "/accounting")
		public void getAccountingList(
				int limit,// 总页数
				int page,// 每页条目				
				HttpServletRequest request,
				HttpServletResponse response,
				Model model) throws IOException {
						
			AccountingDAO adao = new AccountingDAOImpl();
			List<VUserBill> list = adao.getAccountList(page, limit);
			
			int size = adao.getAccountListAmount();
			
			// 回传json字符串
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			ReturnData td = new ReturnData();
			if (list != null) {
				td.code = ReturnData.SUCCESS;
				td.count = size;
				td.msg = "查询成功";
				td.data = list;
			} else {
				td.code = ReturnData.ERROR;
				td.msg = "查询失败";
			}
			out.write(JSON.toJSONString(td));
			out.flush();
			out.close();
		}
		
		//根据条件查询账单
		@RequestMapping(value = "/accountingByCondition")
		public void adduser(int limit,
				int page, 
				String moneyType,//操作类型 
				String starttime,
				String endtime,
				HttpServletRequest request, 
				HttpServletResponse response,
				Model model) throws IOException {
			
			AccountingDAO adao = new AccountingDAOImpl();
			unit.Expression exp = new unit.Expression();
			// 根据条件获取模糊查询
			if (moneyType != null && !moneyType.equals("")) {
				exp.andLike("operation", moneyType, String.class);
			}
			if (starttime != null && !starttime.equals("")) {
				exp.andBetween("billtime", starttime, String.class);
			}
			if (endtime != null && !endtime.equals("")) {
				exp.andAnd(endtime, String.class);
			}

			List<VUserBill> list = adao.getAccountListByCondition(exp.toString(), page, limit);
			int num = adao.getAccountListByConditionAmount(exp.toString());
			// 回传json字符串
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			ReturnData rj = new ReturnData();
			rj.code = ReturnData.SUCCESS;
			rj.msg = "执行成功";
			rj.data = list;
			rj.count = num;
			out.write(JSON.toJSONString(rj));
			out.flush();
			out.close();

		}
		
		//删除账单
		@RequestMapping(value = "/deleteBill")
		public void deleteuserrolemanage(int billid, 
				HttpServletRequest request,
				HttpServletResponse response, 
				Model model) throws IOException {

			AccountingDAO adao = new AccountingDAOImpl();

			 boolean num= adao.deleteAccount(billid);

			response.setCharacterEncoding("utf-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			ReturnData td = new ReturnData();
			if (num == true) {
				td.code = ReturnData.SUCCESS;
				td.msg = "删除成功";

			} else {
				td.code = ReturnData.ERROR;
				td.msg = "删除失败，请重试";
			}
			out.write(JSON.toJSONString(td));
			out.flush();
			out.close();
		}

}
