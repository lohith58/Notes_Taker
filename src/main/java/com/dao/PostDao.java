package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

 
import com.entity.Post;

public class PostDao {

	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addNotes(String ti, String co, int uid) {
		boolean b = false;
		try {
			String query = "insert into post(title,content,userid)values(?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, ti);
			pst.setString(2, co);
			pst.setInt(3, uid);
			int i = pst.executeUpdate();
			if (i == 1) {
				b = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;

	}

	public List<Post> getAllPost(int pid) {

		List<Post> list = new ArrayList<Post>();
		Post p = null;

		try {
			String query = "select * from post where userid=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, pid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				p = new Post();
				p.setId(rs.getInt(1));
				p.setDate(rs.getTimestamp(2));
				p.setTitle(rs.getString(3));
				p.setContent(rs.getString(4));
				 
				list.add(p);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostById(int id) {
		Post p = new Post();
		try {
			PreparedStatement pst = con.prepareStatement("select * from post where id=?");
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				p.setId(rs.getInt(1));
				p.setDate(rs.getTimestamp(2));
				p.setTitle(rs.getString(3));
				p.setContent(rs.getString(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public boolean updatePost(Post p) {
		boolean b = false;
		try {

			String query = "update post set title=?,content=? where id=?";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, p.getTitle());
			pst.setString(2, p.getContent());
			pst.setInt(3, p.getId());

			int i = pst.executeUpdate();
			if (i == 1) {

				b = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	public boolean deletePostById(int id) {
		boolean b = false;
		try {
			String query = "delete from post where id=?";
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, id);
			int i = pst.executeUpdate();
			if (i == 1) {

				b = true;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

}
