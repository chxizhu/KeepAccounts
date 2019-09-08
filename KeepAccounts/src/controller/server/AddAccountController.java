package controller.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TBill;
import model.TUser;
import model.VUserBill;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import unit.ReturnData;
import business.dao.AccountingDAO;
import business.dao.AddAccountDAO;
import business.impl.AccountingDAOImpl;
import business.impl.AddAccountDAOImpl;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping(value = "/addaccountmodel")
public class AddAccountController {

	//添加用户
			@RequestMapping(value = "addaccount")
			public void addAccount(
					/*String userid, //用户ID
*/					Timestamp billtime, //操作时间
					Double money, //钱
					String category, //类别（衣服。。）
					String operation, //操作类别
					String remark, //备注						
					HttpServletRequest request,
					HttpServletResponse response,
					Model model) throws IOException {
				
				AddAccountDAO adao = new AddAccountDAOImpl();			
				TBill user = new TBill();
				
				HttpSession  session   =   request.getSession();    
				TUser TUser = (model.TUser) session.getAttribute("user");
				System.out.println(billtime);
				
				user.setUserid(TUser.getUid());
				user.setBilltime(billtime);
				user.setMoney(money);
				user.setCategory(category);
				user.setOperation(operation);
				user.setRemark(remark);
				
				//添加角色信息
				int num =adao.addAccount(user);
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				ReturnData td = new ReturnData();
				if (num == 0) {
					td.code = ReturnData.SUCCESS;
					td.msg = "添加成功";
				} else {
					td.code = ReturnData.ERROR;
					td.msg = "添加失败";
				}
				out.write(JSON.toJSONString(td));
				out.flush();
				out.close();
			}
			
			//加载表格
			@RequestMapping(value = "/accounting")
			public void getAccountingList(
					int limit,// 总页数
					int page,// 每页条目		
					String userid,
					HttpServletRequest request,
					HttpServletResponse response,
					Model model) throws IOException {
				
				TBill user = new TBill();			
				HttpSession  session   =   request.getSession();    
				TUser TUser = (model.TUser) session.getAttribute("user");//得到当前登录用户对象
				userid = TUser.getUid();		
				
				AddAccountDAO adao = new AddAccountDAOImpl();		
				List<VUserBill> list = adao.getAccountList(userid,page, limit);
				
				int size = adao.getAccountListAmount(userid);
				
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
