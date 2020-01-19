package cn.ssm.pojo;


	public class FileBean {
	    private String filepath;
	    private String filename;

	    public FileBean(){
	        super();
	    }

	    public String getFilepath() {
	        return filepath;
	    }

	    public void setFilepath(String filepath) {
	        this.filepath = filepath;
	    }

	    public String getFilename() {
	        return filename;
	    }

	    public void setFilename(String filename) {
	        this.filename = filename;
	    }

	    @Override
	    public String toString() {
	        return "FileBean{" +
	                "filepath='" + filepath + '\'' +
	                ", filename='" + filename + '\'' +
	                '}';
	    }
	}
