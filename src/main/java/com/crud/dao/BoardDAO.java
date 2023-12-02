package com.crud.dao;

import com.crud.BoardRowMapper;
import com.crud.bean.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
public class BoardDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int insertBoard(BoardVO vo) {
		String sql = "insert into BOARD (title, writer, content, regDate) values ("
				+ "'" + vo.getTitle() + "',"
				+ "'" + vo.getWriter() + "',"
				+ "'" +  vo.getContent() + "',"
				+ "'" +  new Timestamp(new Date().getTime()) + "')";
		return jdbcTemplate.update(sql);
	}

	public List<BoardVO> getBoardList() {
		String sql = "select * from BOARD order by id desc";
		return jdbcTemplate.query(sql, new BoardRowMapper());
	}

	public BoardVO getBoard(int id) {
		String sql = "select * from BOARD where id=" + id;
		return jdbcTemplate.queryForObject(sql, new BoardRowMapper());
	}

	public int updateBoard(BoardVO vo) {
		String sql = "update BOARD set title='" + vo.getTitle() + "',"
				+ " writer='" + vo.getWriter() + "',"
				+ " content='" + vo.getContent() + "' where id=" + vo.getId();
		return jdbcTemplate.update(sql);

	}

	public int deleteBoard(int id) {
		String sql = "delete from BOARD where id= " + id;
		return jdbcTemplate.update(sql);
	}

}
