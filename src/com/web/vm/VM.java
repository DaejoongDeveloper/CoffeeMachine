package com.web.vm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vm")
public class VM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int inMoney=0;

	public void init(ServletConfig config) throws ServletException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 사용자로 폼으로부터 "POST"방식으로 전송되는 한글을 읽기 위한 한글인코딩 설정 Get방식은 서버에서 자동으로 처리됨
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");

		// 커피버튼 처리(btnCoffee)
		String btnCoffee = req.getParameter("btnCoffee");
		String btnCoin = req.getParameter("btnCoin");
		
		//반환버튼 처리(btnReturn)
		String btnReturn = req.getParameter("btnReturn");

		if (btnCoffee != null) {
			if (btnCoffee.equals("밀크")) {
				inMoney -= 300;
				btnCoffee = "milkOut";
			} else if (btnCoffee.equals("프림")) {
				inMoney -= 300;
				btnCoffee = "creamOut";
			} else if (btnCoffee.equals("블랙")) {
				inMoney -= 200;
				btnCoffee = "blackOut";
			} else if (btnCoffee.equals("레쓰비")) {
				inMoney -= 500;
				btnCoffee = "canCoffee";
			}else if (btnCoffee.equals("사이다")) {
				inMoney -= 500;
				btnCoffee = "canFanta";
			}else if (btnCoffee.equals("콜라")) {
				inMoney -= 700;
				btnCoffee = "canCola";
			}
			req.setAttribute("btnCoffee", btnCoffee);
		}

		// 동전버튼 처리(btnCoin)
		if (btnCoin != null) {
			if (btnCoin.equals("500")) {
				inMoney += 500;
			} else if (btnCoin.equals("100")) {
				inMoney += 100;
			} else {
				inMoney += 50;
			}
		}
		int outMoney = 0;
		int m500 = 0;
		int m100 = 0;
		int m50 = 0;
		//반환버튼 처리(잔액을 모두 출력하고 inMoney = 0)
		if(btnReturn != null) {
			outMoney = inMoney;
			inMoney = 0;
			
			if(outMoney >= 700) {
				m500 = outMoney/500;
				m100 = outMoney%500/100;
				m50 = outMoney%500%100/50;
			}
			
			if(outMoney >= 500) {
				m500 = outMoney/500;
				m100 = outMoney%500/100;
				m50 = outMoney%500%100/50;	
			}else if(outMoney >= 100) {
				m100 = outMoney%500/100;
				m50 = outMoney%500%100/50;	
			}else if(outMoney >= 50) {
				m50 = outMoney%500%100/50;	
		}
		}
		String btnMilkState = null;
		String btnCreamState = null;
		String btnBlackState = null;
		String btncanCoffeeState = null;
		String btncanFantaState = null;
		String btncanColaState = null;
		
		//커피 버튼 활성화 처리
		
		if(inMoney >= 700) {
			btncanColaState = "ok";
			btncanFantaState = "ok";
			btncanCoffeeState = "ok";
			btnMilkState = "ok";
			btnCreamState = "ok";
			btnBlackState = "ok";
		}else if(inMoney >= 500) {
			btncanFantaState = "ok";
			btncanCoffeeState = "ok";
			btnMilkState = "ok";
			btnCreamState = "ok";
			btnBlackState = "ok";
		}
		else if(inMoney >= 300) {
			btnMilkState = "ok";
			btnCreamState = "ok";
			btnBlackState = "ok";
			
		}else if(inMoney >= 200) {
			btnBlackState = "ok";
			
		}
		
		req.setAttribute("btnMilkState", btnMilkState);
		req.setAttribute("btnCreamState",btnCreamState);
		req.setAttribute("btnBlackState", btnBlackState);
		req.setAttribute("btncanCoffeeState", btncanCoffeeState);
		req.setAttribute("btncanFantaState", btncanFantaState);
		req.setAttribute("btncanColaState", btncanColaState);
		
		req.setAttribute("inMoney", inMoney);
		req.setAttribute("message", outMoney+"원이 반환되었습니다.");
		req.setAttribute("m500", m500+"개");
		req.setAttribute("m100", m100+"개");
		req.setAttribute("m50", m50+"개");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, res);
	}

}
