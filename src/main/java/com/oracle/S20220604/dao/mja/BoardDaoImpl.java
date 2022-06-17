package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {


	@Autowired
	private SqlSession session;
	
	@Override
	public int boardTotal() {
		int boardTotal = 0;
		try {
			boardTotal = session.selectOne("mjBoardTotal");
		} catch (Exception e) {
			System.out.println("boardTotal dao : " + e.getMessage());
		}
		return boardTotal;
	}


	@Override
	public List<Board> boardList(Board board) {
		List<Board> boardList = null;
		try {
			boardList = session.selectList("mjBoardList", board);
		} catch (Exception e) {
			System.out.println("boardList dao : " + e.getMessage());
		}
		return boardList;
	}


	@Override
	public int writeNotice(Board board) {
		int result = 0;
		try {
			result = session.insert("mjBoardInsert", board);
		} catch (Exception e) {
			System.out.println("writeNotice dao : " + e.getMessage());
		}
		return result;
	}

	

	@Override
	public Board noticeDetail(int board_num) {
		
		Board board = null;
	
		try {	
			board = session.selectOne("mjBoardDetail", board_num);
		} catch (Exception e) {
			System.out.println("noticeDetail dao : " + e.getMessage());
		}
		return board;
	}


	@Override
	public List<Board> boardList() {
		List<Board> boardList = null;
		try {
			boardList = session.selectList("mjBannerBoard");
		} catch (Exception e) {
			System.out.println("BannerBoard dao : " + e.getMessage());
		}
		return boardList;
	}


	@Override
	public int noticeHits(int board_num) {
		int result = 0;
		try {			
			result = session.update("mjBoardHits", board_num);
		} catch (Exception e) {
			System.out.println("noticeHits dao : " + e.getMessage());
		}
		return result;
	}


	@Override
	public int noticeDelete(int board_num) {
		int result = 0;
		try {			
			result = session.delete("mjNoticeDelete", board_num);
		} catch (Exception e) {
			System.out.println("noticeDelete dao : " + e.getMessage());
		}
		return result;
	}
 
}
