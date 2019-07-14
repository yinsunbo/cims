package entity;

public class User {
	private String userName;
	private int noId;
	private String userPassword;
	private int power=1;//权限 0;管理员 1员工用户
	private int cinema_id;
	private int tel;
	private String sex;
	private String email;
	private String age;//出生年份
	private String seniority;//入职时间
	
	@Override
    public String toString() {
        return "User [userName=" + userName + ", noId=" + noId + ", userPassword=" + userPassword + ", power=" + power
                + ", cinema_id=" + cinema_id + ", tel=" + tel + ", sex=" + sex + ", email=" + email + ", age=" + age
                + ", seniority=" + seniority + "]";
    }
    public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSeniority() {
		return seniority;
	}
	public void setSeniority(String seniority) {
		this.seniority = seniority;
	}

	public int getCinema_id() {
		return cinema_id;
	}
	public void setCinema_id(int cinema_id) {
		this.cinema_id = cinema_id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getNoId() {
		return noId;
	}
	public void setNoId(int noId) {
		this.noId = noId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	
	
}
