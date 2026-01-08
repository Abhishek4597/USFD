package com.mvc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mvc.beans.USFD_menu_beans;
import com.mvc.beans.USFD_head_beans;
import com.mvc.util.DBConnection;

public class DDL {
	
	public static List<USFD_head_beans> getUSFDHeads() throws SQLException {

		List<USFD_head_beans> BDBS = new ArrayList<>();
		try {
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();

			String SQL = "SELECT * FROM usfd_heads";
			ResultSet rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				USFD_head_beans BDB = new USFD_head_beans();
				BDB.setHeadid(rs.getInt("head_id"));
				BDB.setHeadname(rs.getString("usfd_head_name"));
				BDBS.add(BDB);
			}

			DBConnection.close(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return BDBS;
	}

	public static List<USFD_menu_beans> getUSFDMenus(int headid) throws SQLException {
		List<USFD_menu_beans> BDBS = new ArrayList<>();

		String SQL = "SELECT * FROM module_master WHERE head_id = " + headid;

		try (Connection con = DBConnection.createConnection();
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL)) {

			while (rs.next()) {
				USFD_menu_beans module = new USFD_menu_beans();
				module.setModule_id(rs.getInt("module_id"));
				module.setModule_name(rs.getString("module_name"));
				module.setHead_id(rs.getInt("head_id"));
				BDBS.add(module);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return BDBS;
	}

	public static List<USFD_menu_beans> getUSFDSubMenus(int menuid) throws SQLException {
		List<USFD_menu_beans> BDBS = new ArrayList<>();

		String SQL = "SELECT * FROM module_master WHERE p_id = " + menuid;

		try (Connection con = DBConnection.createConnection();
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL)) {

			while (rs.next()) {
				USFD_menu_beans module = new USFD_menu_beans();
				module.setModule_id(rs.getInt("module_id"));
				module.setModule_name(rs.getString("module_name"));
				module.setHead_id(rs.getInt("head_id"));
				BDBS.add(module);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return BDBS;
	}

	public static String getMTypeByModuleId(int moduleId) throws SQLException {
	    String mType = null;
	    String SQL = "SELECT m_type FROM module_master WHERE module_id = " + moduleId;

	    try (Connection con = DBConnection.createConnection();
	         Statement stmt = con.createStatement();
	         ResultSet rs = stmt.executeQuery(SQL)) {

	        if (rs.next()) {
	            mType = rs.getString("m_type");
	        }

	        
	        System.out.println("[Fetch m_type] module_id=" + moduleId + ", m_type=" + mType);

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return mType;
	}

	public static String getResult(String Combination) throws SQLException {
		String SQL = "SELECT * FROM result_master WHERE combination = '" + Combination + "'";
		String result = "";

		try (Connection con = DBConnection.createConnection();
			 Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL)) {

			if (!rs.isBeforeFirst()) {
				result = "No Record Found";
			} else {
				while (rs.next()) {
					result = rs.getString("result");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println("hello dear111 " + result);
		return result;
	}
}
