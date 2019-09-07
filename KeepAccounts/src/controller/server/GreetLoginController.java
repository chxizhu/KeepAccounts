package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TBill;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.AccountingDAO;
import business.dao.GreetLoginDAO;
import business.impl.AccountingDAOImpl;
import business.impl.GreetLoginDAOimpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/controller")
public class GreetLoginController {
	
	
			@RequestMapping(value = "/selectincome")
			public void deleteuserrolemanage(
					HttpServletRequest request,
					HttpServletResponse response, 
					Model model) throws IOException {

				GreetLoginDAO adao = new GreetLoginDAOimpl();
				
				TBill tb = new TBill();
				tb.setUserid("201901");
				tb.setOperation("支出");

				 List list= adao.selectincome(tb);
				 System.out.println(list.size());

				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				ReturnData td = new ReturnData();
				if (list.size() >0) {
					td.data = list;
					td.code = ReturnData.SUCCESS;
					td.msg = "成功";
					td.count= list.size();

				} else {
					td.code = ReturnData.ERROR;
					td.msg = "失败，请重试"; 
					
				}
				out.write(JSON.toJSONString(td));
				out.flush();
				out.close();
			}

}
