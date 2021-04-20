package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public int write(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.insert("board.write", boardVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList("board.list", scri);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("board.read", bno);
	}

	@Override
	public int update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return sql.update("board.update", boardVO);
	}

	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.delete("board.delete", bno);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("board.listCount", scri);
	}

}
