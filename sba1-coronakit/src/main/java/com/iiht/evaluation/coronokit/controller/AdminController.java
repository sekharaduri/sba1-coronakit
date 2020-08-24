package com.iiht.evaluation.coronokit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iiht.evaluation.coronokit.dao.ProductMasterDao;
import com.iiht.evaluation.coronokit.model.ProductMaster;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductMasterDao productMasterDao;


	public void setProductMasterDao(ProductMasterDao productMasterDao) {
		this.productMasterDao = productMasterDao;
	}

	public void init(ServletConfig config) {
		String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
		String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");
		System.out.println(jdbcURL + "--"+ jdbcUsername+"--"+jdbcPassword);

		this.productMasterDao = new ProductMasterDao("jdbc:sqlserver://LAPTOP-E94HUCIQ;databaseName=coronadb",
				"sekhar", "testdb");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action =  request.getParameter("action");

		String viewName = "";
		try {
			switch (action) {
			case "login" : 
				viewName = adminLogin(request, response);
				break;
			case "newproduct":
				viewName = showNewProductForm(request, response);
				break;
			case "insertproduct":
				viewName = insertProduct(request, response);
				break;
			case "deleteproduct":
				viewName = deleteProduct(request, response);
				break;
			case "editproduct":
				viewName = showEditProductForm(request, response);
				break;
			case "updateproduct":
				viewName = updateProduct(request, response);
				break;
			case "list":
				viewName = listAllProducts(request, response);
				break;	
			case "logout":
				viewName = adminLogout(request, response);
				break;	
			default : viewName = "notfound.jsp"; break;		
			}
		} catch (Exception ex) {
			throw new ServletException(ex.getMessage());
		}


		RequestDispatcher dispatch = 
		request.getRequestDispatcher(viewName);
		dispatch.forward(request, response);


	}

	private String adminLogout(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "";
	}

	private String listAllProducts(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {

		List<ProductMaster> allProducts = this.productMasterDao.getProductRecords();

		//products = this.productMasterDao.getProductRecords();
		request.setAttribute("list", allProducts);

		return "listproducts.jsp";
	}

	private String updateProduct(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		int ProductId=Integer.parseInt(request.getParameter("editproductId"));
		String ProductName=request.getParameter("epname");
		String Description=request.getParameter("epdesc");
		int Cost=Integer.parseInt(request.getParameter("ecost"));		  


		boolean recordAdded = productMasterDao.updateProduct(ProductId, ProductName, Description, Cost);

		return listAllProducts(request, response);
	}

	private String showEditProductForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		request.setAttribute("id", request.getParameter("id"));
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("description", request.getParameter("description"));
		request.setAttribute("cost", request.getParameter("cost"));
		
		
		return "editproduct.jsp";
	}

	private String deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		int ProductId=Integer.parseInt(request.getParameter("id"));

		boolean recordDeleted = productMasterDao.deleteProduct(ProductId);
		//recordDeleted = true;
		System.out.println("Product has been deleted...1");

		if (recordDeleted== true) {
			System.out.println("Product has beesn deleted...2");
			request.setAttribute("delete", ProductId);
		}

		return "deleteproduct.jsp";
	}

	private String insertProduct(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		
		String ProductName=request.getParameter("pname");
		String Description=request.getParameter("pdesc");
		int Cost=Integer.parseInt(request.getParameter("cost"));		  


		boolean recordAdded = this.productMasterDao.addNewProduct(ProductName, Description, Cost);

		return listAllProducts(request, response);
	}

	private String showNewProductForm(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		return "newproduct.jsp";
	}

	private String adminLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {

		String uname = request.getParameter("loginid");
		String password = request.getParameter("password");
		System.out.println("UNAME : " + uname);
		System.out.println("PASSWORD : " + password);
		
		if(uname.equals("admin") && password.equals("admin"))
			return listAllProducts(request, response);
		else
			return "errorPage.jsp";
	}

}