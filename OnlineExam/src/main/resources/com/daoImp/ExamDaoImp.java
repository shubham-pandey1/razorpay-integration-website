package com.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.ExamDao;
import com.db.Conpro;
import com.entity.AllExam;
import com.entity.Answer;
import com.entity.Exam;
import com.entity.Result;

public class ExamDaoImp implements ExamDao{
	
	PreparedStatement ps;
	ResultSet rs;
	Connection con;
	
	public ExamDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}

	@Override
	public int examRegistration(Exam exam) {
		// TODO Auto-generated method stub
		int n = 0;
		
		try {
			String sql = "insert into exam(name,duration) values(?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, exam.getName());
			ps.setString(2, exam.getDuration());
			
			int i = ps.executeUpdate();
			if(i>0) {
				try {
					
				ps  = con.prepareStatement("select max(eid) from exam");
				rs = ps.executeQuery();
				while(rs.next())
					n = rs.getInt(1);
				
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			ps.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public boolean createTable(String name) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "create table "+name+" (QId int auto_increment primary key, Question varchar(255), optiona varchar(255), optionb varchar(255), optionc varchar(255), optiond varchar(255), answer varchar(255));";
			
			ps = con.prepareStatement(sql);
//			ps.setString(1, name);
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<AllExam> allExams() {
		// TODO Auto-generated method stub
		List<AllExam> list = new ArrayList<AllExam>();
		try {
			ps = con.prepareStatement("Select * from exam");
			rs = ps.executeQuery();
			while(rs.next()) {
				AllExam allExam = new AllExam();
				allExam.setEname(rs.getString(2));
				allExam.setEid(rs.getInt(1)+"");
				
//				for no of registered candidate
				PreparedStatement ps1 = con.prepareStatement("select count(sid) from user where examid = ?");
				ps1.setInt(1, rs.getInt(1));
				
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next())
					allExam.setNocandidate(rs1.getInt(1)+"");
				
				String sql = "Select count(qid) from examquest"+rs.getInt(1);
				PreparedStatement ps2 = con.prepareStatement(sql);
				
				ResultSet rs2 = ps2.executeQuery();
				while(rs2.next())
					allExam.setNoquest(rs2.getInt(1)+"");
				
				allExam.setDuration(rs.getString(3));
				
				list.add(allExam);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Exam> examName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateExam(Exam exam) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			String sql = "update exam set name = ?, duration = ? where eid = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, exam.getName());
			ps.setString(2, exam.getDuration());
			ps.setInt(3, exam.getEid());
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Exam examById(int eid) {
		// TODO Auto-generated method stub
		Exam exam= new Exam();
		try {
			ps = con.prepareStatement("select * from exam where eid = ?");
			ps.setInt(1, eid);
			
			rs = ps.executeQuery();
			while(rs.next())
			{
				exam.setEid(rs.getInt(1));
				exam.setName(rs.getString(2));
				exam.setDuration(rs.getString(3));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return exam;
	}

	@Override
	public boolean deleteExam(int eid) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			ps = con.prepareStatement("delete from exam where eid = ?");
			ps.setInt(1, eid);
			
			int i = ps.executeUpdate();
			if(i>0) f= true;
			
			ps.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Result> result() {
		// TODO Auto-generated method stub
		List<Result> list= new ArrayList<>();
		String sql = "Select * from result";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Result res = new Result();
				
				res.setRid(rs.getInt(1));
				res.setSid(rs.getInt(2));
				res.setEid(rs.getInt(3));
				res.setName(rs.getString(4));
				res.setEmail(rs.getString(5));
				res.setExam(rs.getString(6));
				res.setCorrect(rs.getInt(7));
				res.setIncorrect(rs.getInt(8));
				res.setTotal(rs.getInt(9));
				
				list.add(res);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Exam> exames() {
		// TODO Auto-generated method stub
		List <Exam> list = new ArrayList<>();
		
		try {
			ps = con.prepareStatement("Select * from exam");
			rs = ps.executeQuery();
			while(rs.next()) {
				Exam exam = new Exam();
				exam.setEid(rs.getInt(1));
				exam.setName(rs.getString(2));
				
				list.add(exam);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean examAnswer(String name) {
		// TODO Auto-generated method stub
		
		boolean f = false;
		try {
			String sql = "create table "+name+" (AId int auto_increment primary key, uid int, qid int, Answer varchar(10), status varchar(10));";
			
			ps = con.prepareStatement(sql);
//			
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean saveAnswer(Answer ans, int eid) {
		// TODO Auto-generated method stub
		boolean su = false, f = false;
		
		try {
			String sql = "Select * from examanswer"+eid +" where uid = ? and qid = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, ans.getUid());
			ps.setInt(2, ans.getQid());
			
			rs = ps.executeQuery();
			
			
			if(rs.next()) su = true;
			
			int i;
			if(su) {
				sql = "update examanswer"+eid+" set answer = ?, status = ? where uid = ? and qid = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, ans.getAnswer());
				ps.setString(2, ans.getStatus());
				ps.setInt(3, ans.getUid());
				ps.setInt(4, ans.getQid());
				
				i = ps.executeUpdate();
				if(i>0) f= true;
			}
			else {
				sql = "insert into examanswer"+eid+ "(uid, qid, answer, status) values(?,?,?,?)";
				ps = con.prepareStatement(sql);
				
				ps.setInt(1, ans.getUid());
				ps.setInt(2, ans.getQid());
				ps.setString(3, ans.getAnswer());
				ps.setString(4, ans.getStatus());
				
				i = ps.executeUpdate();
				if(i>0) f= true;
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Result resultData(int uid, int eid) {
		// TODO Auto-generated method stub
		Result result = new Result();
		int n = 0;
		try {
			String sql = "Select count(uid) from examanswer"+eid+ " where uid = ? and status = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, true+"");
			
			rs = ps.executeQuery();
			
			while(rs.next()) 
				n = rs.getInt(1);
			
			result.setCorrect(n);
			
//			counting wrong answer
			sql = "Select count(uid) from examanswer"+eid+ " where uid = ? and status = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, false+"");
			
			rs = ps.executeQuery();
			
			n = 0;
			while(rs.next()) 
				n = rs.getInt(1);
			
			result.setIncorrect(n);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean saveResult(Result result) {
		// TODO Auto-generated method stub
		boolean f = false;
		String sql = "insert into result (sid,eid,name,email,exam,correct, incorrect, total) values(?,?,?,?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, result.getSid());
			ps.setInt(2, result.getEid());
			ps.setString(3, result.getName());
			ps.setString(4, result.getEmail());
			ps.setString(5, result.getExam());
			ps.setInt(6, result.getCorrect());
			ps.setInt(7, result.getIncorrect());
			ps.setInt(8, result.getTotal());
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	

}
