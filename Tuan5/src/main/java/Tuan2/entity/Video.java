package Tuan2.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

@Entity
@Table(name = "videos")
@NamedQueries({ @NamedQuery(name = "Video.findAll", query = "SELECT v FROM Video v"),
		@NamedQuery(name = "Video.searchByTitle", query = "SELECT v FROM Video v WHERE v.title LIKE :title") })
public class Video implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "videoId")
	private int videoId;

	@Column(name = "active")
	private boolean active = true;

	@Column(name = "description", columnDefinition = "NVARCHAR(MAX) NULL")
	private String description;

	@Column(name = "poster", columnDefinition = "NVARCHAR(255) NULL")
	private String poster;

	@Column(name = "title", columnDefinition = "NVARCHAR(255) NULL")
	private String title;

	@Column(name = "views")
	private int views = 0;

	@ManyToOne
	@JoinColumn(name = "cate_id")
	private Category category;

	public Video() {
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
