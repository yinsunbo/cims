package entity;

public class Page {
	
    private int start;
	private int size;
	private int id;
	public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Page(int p) {
	    this.size=15;
		init(p, size);
	}
	public Page(int p,int size) {
		this.size=size;
		this.init(p, size);
	}
	
    public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	private void init(int p,int size) {
	    if(p<=1) {
            this.start=0;
        }else {
            this.start=(p-1)*size;
        }
	}
    @Override
    public String toString() {
        return "Page [start=" + start + ", size=" + size + ", id=" + id + "]";
    }
    
	
}
