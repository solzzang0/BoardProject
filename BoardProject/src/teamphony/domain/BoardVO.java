package teamphony.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class BoardVO {

	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewCnt;
	private int replyCnt;
	
	private String[] files;
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
	
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "bno = "+ bno +"\n"
				+"title = " + title +"\n"
				+"content = " + content +"\n"
				+" writer = "+ writer +"\n"
				+"regdate = "+ regdate +"\n"
				+"viewCnt = "+ viewCnt +"\n"
				+"replyCnt = "+ replyCnt +"\n"
				;
	}
	
	
	
	
}
