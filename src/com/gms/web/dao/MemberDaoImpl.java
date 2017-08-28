package com.gms.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.gms.web.command.Command;
import com.gms.web.constant.Database;
import com.gms.web.constant.SQL;
import com.gms.web.constant.Vendor;
import com.gms.web.domain.MajorBean;
import com.gms.web.domain.MemberBean;
import com.gms.web.domain.StudentBean;
import com.gms.web.factory.DatabaseFactory;


public class MemberDaoImpl implements MemberDao{
	public static MemberDaoImpl getInstance() {return new MemberDaoImpl();}
	Connection conn;
	private MemberDaoImpl() {
	conn=null;
	}
	
	   @Override
	   public String insert(Map<?,?>map) {
			String rs="";
			MemberBean member= (MemberBean)map.get("member");
			@SuppressWarnings("unchecked")
			List<MajorBean> list=(List<MajorBean>)map.get("major");
			PreparedStatement pstmt=null;
			
			//트랜잭션 (2개테이블에 값을 나눠서 집어넣는것)
			try {
				conn=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD).getConnection();
				conn.setAutoCommit(false);
				pstmt=conn.prepareStatement(SQL.MEMBER_INSERT);	
						pstmt.setString(1, member.getId());
						pstmt.setString(2, member.getName());
						pstmt.setString(3, member.getPw());
						pstmt.setString(4, member.getSsn());
						pstmt.setString(5, member.getPhone());
						pstmt.setString(6, member.getEmail());
						pstmt.setString(7, member.getProfile());
					System.out.println("***"+SQL.MEMBER_INSERT);
					pstmt.executeUpdate();
					for(int i=0;i<list.size();i++){
						pstmt=conn.prepareStatement(SQL.MAJOR_INSERT);
						pstmt.setString(1, list.get(i).getMajorId());
						pstmt.setString(2, list.get(i).getTitle());
						pstmt.setString(3, list.get(i).getId());
						pstmt.setString(4, list.get(i).getSubjId());
						rs=String.valueOf(pstmt.executeUpdate());
					}
					System.out.println("메이저 : "+SQL.MAJOR_INSERT);
				
				conn.commit();
				
			} catch (Exception e) {
				e.printStackTrace();
				if(conn !=null){
					try{
						conn.rollback();
					}catch(SQLException ex){
						e.printStackTrace();
					}
				}
			}
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return rs;
		}


	@Override
	public List<?> selectAll(Command cmd) {
		List<StudentBean> list=new ArrayList<>();
		try {
			StudentBean member=null;
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_LIST);
			pstmt.setString(1, cmd.getStartRow());
			pstmt.setString(2, cmd.getEndRow());
					ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				member=new StudentBean();
				member.setId(rs.getString(Database.MEMBER_ID));
				member.setName(rs.getString(Database.MEMBER_NAME));
				member.setRegdate(rs.getString(Database.MEMBER_REGDATE));
				member.setSsn(rs.getString(Database.MEMBER_SSN));
				member.setTitle(rs.getString(Database.TITLE));
				member.setNum(rs.getString(Database.NUM));
				member.setPhone(rs.getString(Database.PHONE));
				member.setEmail(rs.getString(Database.EMAIL));
				list.add(member);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public String count(Command cmd) {
		int count=0;
		try {
			ResultSet rs=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD)
					.getConnection().prepareStatement(SQL.STUDENT_COUNT).executeQuery();
			if(rs.next()){
				count=rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(count);
	}

	@Override
	public MemberBean selectById(Command cmd) {
		MemberBean member=null;
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD)
					.getConnection().prepareStatement(SQL.MEMBER_FINDBYID);
			pstmt.setString(1, cmd.getSearchWord());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				member=new MemberBean();
				member.setName(rs.getString(Database.MEMBER_NAME));
				member.setId(rs.getString(Database.MEMBER_ID));
				member.setPw(rs.getString(Database.MEMBER_PASSWORD));
				member.setSsn(rs.getString(Database.MEMBER_SSN));
				member.setRegdate(rs.getString(Database.MEMBER_REGDATE));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public List<StudentBean> selectByName(Command cmd) {
			List<StudentBean> list=new ArrayList<>();
		
		try {
			StudentBean student=null;
			conn=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD).getConnection();
			PreparedStatement pstmt=conn.prepareStatement(SQL.STUDENT_SEARCH);
			pstmt.setString(1,"%" + cmd.getSearchWord()+ "%");
			pstmt.setString(2, cmd.getStartRow());
			pstmt.setString(3, cmd.getEndRow());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				student=new StudentBean();
				student.setId(rs.getString(Database.MEMBER_ID));
				student.setName(rs.getString(Database.MEMBER_NAME));
				student.setRegdate(rs.getString(Database.MEMBER_REGDATE));
				student.setSsn(rs.getString(Database.MEMBER_SSN));
				student.setTitle(rs.getString(Database.TITLE));
				student.setNum(rs.getString(Database.NUM));
				student.setPhone(rs.getString(Database.PHONE));
				student.setEmail(rs.getString(Database.EMAIL));
				list.add(student);
				System.out.println("회원이름"+student.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String update(MemberBean member) {
		Command cmd=new Command();
		cmd.setSearchWord(member.getId());
		MemberBean temp=selectById(cmd);
		String id=(member.getId().equals(""))?temp.getId():member.getId();
		String pw=(member.getPw().equals(""))?temp.getPw():member.getPw();
		String rs="";
			try {
				PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD)
						.getConnection().prepareStatement(SQL.MEMBER_UPDATE);
				pstmt.setString(1, pw);
				pstmt.setString(2, id);
				rs=String.valueOf(pstmt.executeUpdate());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			System.out.println("rs"+rs);
		return rs;
	}

	@Override
	public String delete(Command cmd) {
		String rs="";
		try {
			PreparedStatement pstmt=DatabaseFactory.createDatabase(Vendor.ORACLE, Database.USERNAME,Database.PASSWORD)
					.getConnection().prepareStatement(SQL.MEMBER_DELETE);
			pstmt.setString(1, cmd.getSearchWord());
			rs=String.valueOf(pstmt.executeUpdate());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

}
