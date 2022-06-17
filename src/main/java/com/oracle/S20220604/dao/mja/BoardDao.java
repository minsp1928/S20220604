package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Board;

public interface BoardDao {


	int             boardTotal();

	List<Board> 	boardList(Board board);
	
	List<Board> 	boardList();

	int 			writeNotice(Board board);

	Board 			noticeDetail(int board_num);

	int noticeHits(int board_num);

	int noticeDelete(int board_num);

	
}
