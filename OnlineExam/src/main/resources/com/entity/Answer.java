package com.entity;

public class Answer {
	private int Aid, Uid, Qid;
	private String answer, status;

	public int getAid() {
		return Aid;
	}

	public Answer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setAid(int aid) {
		Aid = aid;
	}

	public int getUid() {
		return Uid;
	}

	public void setUid(int uid) {
		Uid = uid;
	}

	public int getQid() {
		return Qid;
	}

	public void setQid(int qid) {
		Qid = qid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Answer(int aid, int uid, int qid, String answer, String status) {
		super();
		Aid = aid;
		Uid = uid;
		Qid = qid;
		this.answer = answer;
		this.status = status;
	}

	
}
