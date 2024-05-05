package entity;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:43:53 AM
 */
public class Student {
	private String id;
	private String name;
	private String sex;
	private String signature;
	private String image;
	/**
	 * 
	 */
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param id
	 * @param name
	 * @param sex
	 * @param signature
	 * @param image
	 */
	public Student(String id, String name, String sex, String signature, String image) {
		super();
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.signature = signature;
		this.image = image;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", sex=" + sex + ", signature=" + signature + ", image=" + image
				+ "]";
	}
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * @param sex the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * @return the signature
	 */
	public String getSignature() {
		return signature;
	}
	/**
	 * @param signature the signature to set
	 */
	public void setSignature(String signature) {
		this.signature = signature;
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
