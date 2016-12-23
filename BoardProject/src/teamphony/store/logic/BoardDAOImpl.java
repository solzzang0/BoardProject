package teamphony.store.logic;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JacksonInject;

import teamphony.domain.BoardVO;
import teamphony.store.facade.BoardDAO;
import teamphony.store.mapper.BoardMapper;


@Repository
public class BoardDAOImpl implements BoardDAO{
	
	private static final String Resource ="config.xml";
	
	
	private SqlSessionFactory getSessionFactory(){
		
		Reader reader = null;
		
		try {
			reader = Resources.getResourceAsReader(Resource);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new SqlSessionFactoryBuilder().build(reader);
	}

	
	
	
	@Override
	public void create(BoardVO vo) throws Exception {
		
		SqlSession session =getSessionFactory().openSession();
		
		try{
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.create(vo);
			session.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		
		SqlSession session = getSessionFactory().openSession();
		BoardVO boardAO = new BoardVO();
		
		try{
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardAO = mapper.read(bno);
			
		}finally {
			session.close();
		}
		return boardAO;
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		
		SqlSession session = getSessionFactory().openSession();
		 try{

			 BoardMapper mapper =session.getMapper(BoardMapper.class);
			 mapper.update(vo);
			 session.commit();
			 
		 }finally{
			 session.close();
		 }
		
	}

	@Override
	public void delete(int bno) throws Exception {
		
		SqlSession session = getSessionFactory().openSession();
		
		try{
			
			BoardMapper mapper =session.getMapper(BoardMapper.class);
			mapper.delete(bno);
			session.commit();
			
		}finally {
			session.close();
		}
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		
		List<BoardVO> list = new ArrayList<>();
		SqlSession session = getSessionFactory().openSession();
		
		try{
			
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			list = mapper.listAll();
		}finally {
			session.close();
		}
		return list;
	}




	@Override
	public void addAttach(String fullName) throws Exception {
		
		SqlSession session = getSessionFactory().openSession();
		
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.addAttach(fullName);
			session.commit();
		}finally{
			session.close();
		}
		
	}




	@Override
	public List<String> getAttach(int bno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
