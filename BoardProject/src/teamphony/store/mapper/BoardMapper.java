package teamphony.store.mapper;

import java.util.List;

import teamphony.domain.BoardVO;

public interface BoardMapper {
	
	public void create(BoardVO boardVO);
	
	public BoardVO read(int bno);
	
	public void update(BoardVO boardVO);
	
	public void delete(int bno);
	
	public List<BoardVO> listAll();
	
	public void addAttach(String fullName);
	
	public String getAttach(int bno);

}
