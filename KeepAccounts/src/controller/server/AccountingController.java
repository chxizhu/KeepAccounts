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

}
