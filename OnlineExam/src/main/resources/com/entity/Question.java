package com.entity;

public class Question {
	private int qid;
	private String quest,optiona,optionb,optionc,optiond,answer;
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQuest() {
		return quest;
	}
	public void setQuest(String quest) {
		this.quest = quest;
	}
	public String getOptiona() {
		return optiona;
	}
	public void setOptiona(String optiona) {
		this.optiona = optiona;
	}
	public String getOptionb() {
		return optionb;
	}
	public void setOptionb(String optionb) {
		this.optionb = optionb;
	}
	public String getOptionc() {
		return optionc;
	}
	public void setOptionc(String optionc) {
		this.optionc = optionc;
	}
	public String getOptiond() {
		return optiond;
	}
	public void setOptiond(String optiond) {
		this.optiond = optiond;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Question [qid=" + qid + ", quest=" + quest + ", optiona=" + optiona + ", optionb=" + optionb
				+ ", optionc=" + optionc + ", optiond=" + optiond + ", answer=" + answer + "]";
	}
	
}
