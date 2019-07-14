package entity;

public class Seat {
	
	
    private int seat_id;
	private String seat_name;
	private String seat_map;
	private int cinema_id;
	private int seat_row;
	private int seat_column;
	
	
	public String getSeat_map() {
		return seat_map;
	}
	public void setSeat_map(String seat_map) {
		this.seat_map = seat_map;
	}
	public int getCinema_id() {
		return cinema_id;
	}
	public void setCinema_id(int cinema_id) {
		this.cinema_id = cinema_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
    public int getSeat_row() {
        return seat_row;
    }
    public void setSeat_row(int seat_row) {
        this.seat_row = seat_row;
    }
    public int getSeat_column() {
        return seat_column;
    }
    public void setSeat_column(int seat_column) {
        this.seat_column = seat_column;
    }
    @Override
    public String toString() {
        return "Seat [seat_id=" + seat_id + ", seat_name=" + seat_name + ", seat_map=" + seat_map + ", cinema_id="
                + cinema_id + ", seat_row=" + seat_row + ", seat_column=" + seat_column + "]";
    }
	
}
