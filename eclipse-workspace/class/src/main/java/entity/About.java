package entity;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:40:15 AM
 */
public class About {
	private String title;
	private String content;	
	private String image;
	/**
	 * 
	 */
	public About() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param title
	 * @param content
	 * @param image
	 */
	public About(String title, String content, String image) {
		super();
		this.title = title;
		this.content = content;
		this.image = image;
	}
	@Override
	public String toString() {
		return "About [title=" + title + ", content=" + content + ", image=" + image + "]";
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		this.image = image;
	}
	
}
