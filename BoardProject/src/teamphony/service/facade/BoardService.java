package teamphony.service.facade;

import java.util.List;

import teamphony.domain.BoardVO;

public interface BoardService {
	
	
	public void regist(BoardVO boardVO) throws Exception;
	
	public BoardVO read(int bno) throws Exception ;
	
	public void modify(BoardVO boardVO) throws Exception ;
	
	public void remove(int bno) throws Exception ;
	
	public List<BoardVO> listAll() throws Exception ;
	
	public List<String> getAttach(int bno) throws Exception;
	
	
	

}
