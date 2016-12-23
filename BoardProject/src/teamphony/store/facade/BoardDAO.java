package teamphony.store.facade;

import java.util.List;

import teamphony.domain.BoardVO;

public interface BoardDAO {
	
	public void create(BoardVO vo)throws Exception;
	
	public BoardVO read(int bno)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public void delete(int bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;

	public void addAttach(String fullName)throws Exception;
	
	public List<String> getAttach(int bno)throws Exception;
}
