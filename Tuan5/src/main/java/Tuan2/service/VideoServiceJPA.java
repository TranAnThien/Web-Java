package Tuan2.service;

import java.util.List;

import Tuan2.dao.VideoDaoJPA;
import Tuan2.entity.Video;

public class VideoServiceJPA {
	private VideoDaoJPA dao = new VideoDaoJPA();

	public void create(Video v) {
		dao.create(v);
	}

	public void update(Video v) {
		dao.update(v);
	}

	public void delete(int id) {
		dao.delete(id);
	}

	public Video findById(int id) {
		return dao.findById(id);
	}

	public List<Video> findAll() {
		return dao.findAll();
	}

	public List<Video> search(String keyword) {
		return dao.searchByTitle(keyword);
	}
}