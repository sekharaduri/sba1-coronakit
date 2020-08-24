package com.iiht.evaluation.coronokit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.iiht.evaluation.coronokit.model.ProductMaster;




public class ProductMasterDao {

	private String jdbcURL;
	private String jdbcUsername;
	private String jdbcPassword;
	private Connection jdbcConnection;

	public ProductMasterDao(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
	
	protected void connect() throws SQLException {
		if (jdbcConnection == null || jdbcConnection.isClosed()) {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			} catch (ClassNotFoundException e) {
				throw new SQLException(e);
			}
			jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		}
	}

	protected void disconnect() throws SQLException {
		if (jdbcConnection != null && !jdbcConnection.isClosed()) {
			jdbcConnection.close();
		}
	}

	// add DAO methods as per requirements
	
	public List<ProductMaster> getProductRecords() throws ClassNotFoundException, SQLException {
		String sql = "select * from product";
		
		this.connect();
		
		Statement stmt = this.jdbcConnection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		// map it to model
		List<ProductMaster> productMasterList = new ArrayList<ProductMaster>();
		
		while(rs.next()) {
			ProductMaster productMaster = new ProductMaster(rs.getInt("ProductId"), 
											 rs.getString("ProductName"), 
											 rs.getString("Description"), 
											 rs.getInt("Cost"));
			productMasterList.add(productMaster);		
		}
		
		rs.close();
		stmt.close();
		this.disconnect();
		
		return productMasterList;
	}
	
	public List<ProductMaster> getProductRecordById(Integer id) throws ClassNotFoundException, SQLException {
		String sql = "select * from product where ProductId=?";
		
		this.connect();
		
		PreparedStatement stmt = this.jdbcConnection.prepareStatement(sql);
		stmt.setInt(1, id);
		ResultSet rs = stmt.executeQuery();
		
		// map it to model
		List<ProductMaster> productMasterList = new ArrayList<ProductMaster>();
		
		while(rs.next()) {
			ProductMaster productMaster = new ProductMaster(rs.getInt("ProductId"), 
											 rs.getString("ProductName"), 
											 rs.getString("Description"), 
											 rs.getInt("Cost"));
			productMasterList.add(productMaster);		
		}
		
		rs.close();
		stmt.close();
		this.disconnect();
		
		return productMasterList;
	}

	public boolean addNewProduct(String ProductName, String Description, int Cost) throws ClassNotFoundException, SQLException {
		//String sql = "insert into product(ProductId, ProductName, Description, Cost) values(?,?,?,?)";
		//String sql = "insert into product(ProductId, ProductName, Description, Cost) values(?,?,?,?)";
		String str="insert into product values('"+ProductName+"','"+Description+"',"+Cost+")";
		
		this.connect();
		
		Statement pstmt = this.jdbcConnection.createStatement();
		/*
		 * pstmt.setInt(1, ProductId); pstmt.setString(2, ProductName);
		 * pstmt.setString(3, Description); pstmt.setInt(4, Cost);
		 */
		
		//boolean added = pstmt.executeUpdate() > 0;
		pstmt.executeUpdate(str);
		//this.jdbcConnection.commit();
		pstmt=null;
		//pstmt.close();
		this.disconnect();
		return true;
	}

	public boolean deleteProduct(int id) throws ClassNotFoundException, SQLException {
		
		String sql = "delete from product where ProductId=?";
		this.connect();
		
		PreparedStatement pstmt = this.jdbcConnection.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		boolean deleted = pstmt.executeUpdate() > 0;
		
		pstmt.close();
		this.disconnect();
		return deleted;
	}
	
	public boolean updateProduct(int ProductId, String ProductName, String Description, int Cost) throws ClassNotFoundException, SQLException {
		//String sql = "insert into product(ProductId, ProductName, Description, Cost) values(?,?,?,?)";
		//String sql = "update product set ProductName=?, Description=?, Cost=? where ProductId=?";				
		String sql = "update product set ProductName='"+ProductName+"',Description='"+Description+"',Cost="+Cost+" where ProductId="+ProductId+"";
		
		this.connect();
					
		Statement pstmt = this.jdbcConnection.createStatement();
		
		pstmt.executeUpdate(sql);
		//boolean updated = pstmt.executeUpdate() > 0;
		pstmt=null;
		//pstmt.close();
		this.disconnect();
		return true;
	}

	
}