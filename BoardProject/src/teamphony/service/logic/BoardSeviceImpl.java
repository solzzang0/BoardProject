package teamphony.service.logic;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import teamphony.domain.BoardVO;
import teamphony.service.facade.BoardService;
import teamphony.store.facade.BoardDAO;

@Transactional
@Service
public class BoardSeviceImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	private BoardVO boardVO;
	
	@Override
	public void regist(BoardVO boardVO) throws Exception {
		dao.create(boardVO);
		
		String[] files = boardVO.getFiles();
		
		if(files == null){
			return;
		}
		for(String fileName : files){
			dao.addAttach(fileName);
		}
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void modify(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}

	@Override
	public void remove(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<String> getAttach(int bno) throws Exception {
		
		return dao.getAttach(bno);
	}

}
