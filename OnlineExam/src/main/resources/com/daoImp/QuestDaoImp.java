package com.daoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.QuestDao;
import com.entity.Question;

public class QuestDaoImp implements QuestDao{
	
	PreparedStatement ps;
	Connection con;
	ResultSet rs;
	
	public QuestDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}

	@Override
	public int addQuest(Question question, int eid) {
		// TODO Auto-generated method stub
		int n = 0;
		String sql = "insert into ExamQuest"+eid+"(Question,optiona,optionb,optionc,optiond,answer) values(?,?,?,?,?,?)";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, question.getQuest());
			ps.setString(2, question.getOptiona());
			ps.setString(3, question.getOptionb());
			ps.setString(4, question.getOptionc());
			ps.setString(5, question.getOptiond());
			ps.setString(6, question.getAnswer());
			
			int i = ps.executeUpdate();
			if(i>0) {
				ps = con.prepareStatement("select max(qid) from examquest"+eid);
				rs = ps.executeQuery();
				while(rs.next()) 
					n = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public List<Question> allQuestion(String eid) {
		// TODO Auto-generated method stub
		List<Question> list = new ArrayList<Question>();
		
		String sql = "Select * from examquest"+eid;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Question quest = new Question();
				quest.setQid(rs.getInt(1));
				quest.setQuest(rs.getString(2));
				quest.setOptiona(rs.getString(3));
				quest.setOptionb(rs.getString(4));
				quest.setOptionc(rs.getString(5));
				quest.setOptiond(rs.getString(6));
				quest.setAnswer(rs.getString(7));
				
				list.add(quest);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteQuest(String qid, String eid) {
		// TODO Auto-generated method stub
		String sql = "delete from examquest"+eid+" where qid = ?";
		boolean f = false;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, qid);
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean editQuest(String eid, Question quest) {
		// TODO Auto-generated method stub
		String sql = "update examquest"+eid+" set question = ?, optiona = ?, optionb = ?, optionc = ?, optiond = ?,answer = ? where qid = ?";
		boolean f = false;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, quest.getQuest());
			ps.setString(2, quest.getOptiona());
			ps.setString(3, quest.getOptionb());
			ps.setString(4, quest.getOptionc());
			ps.setString(5, quest.getOptiond());
			ps.setString(6, quest.getAnswer());
			ps.setString(7, quest.getQid()+"");
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Question getQuestion(String qid, String eid) {
		// TODO Auto-generated method stub
		Question quest =  new Question();
		
		String sql = "Select * from examquest"+eid +" where qid = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, qid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				quest.setQid(rs.getInt(1));
				quest.setQuest(rs.getString(2));
				quest.setOptiona(rs.getString(3));
				quest.setOptionb(rs.getString(4));
				quest.setOptionc(rs.getString(5));
				quest.setOptiond(rs.getString(6));
				quest.setAnswer(rs.getString(7));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return quest;
	}

	@Override
	public int noQuestion(String eid) {
		// TODO Auto-generated method stub
		int noquest = 0;
		
		try {
			ps = con.prepareStatement("select count(qid) from examquest"+eid);
			rs = ps.executeQuery();
			
			while(rs.next())
				noquest = rs.getInt(1);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return noquest;
	}

}
