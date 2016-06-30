package cn.sdu.travel.utils;

public class Constants {
	//用来配置文件的临时存储路径
	public static final String FILE_TEMP_DIR = "D:\\travelmanagement_files\\temp";
	//用来配置文件的保存路径
	public static final String FILE_SAVE_DIR = "D:\\travelmanagement_files\\save";
	//图片的保存路径
	public static final String FILE_SAVE_IMG_DIR = "D:\\travelmanagement_files\\save\\images";
	//映射的保存文件的目录的url
	public static final String MAP_SAVE_FILE = "/files";
	//映射保存图片的url
	public static final String MAP_SAVE_IMG = "/pictures";
	//连接人事库的url
	public static final String DB_HUMAN_RESOURCE = "jdbc:mysql://localhost:3306/human_resource_db";
	//连接人事库的url
	public static final String DB_MANAGEMENT = "jdbc:mysql://localhost:3306/management";
	//数据库用户名
	public static final String DB_USERNAME = "root";
	//数据库密码
	public static final String DB_PASSWORD = "travelmanagement6";
	//数据库驱动器
	public static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	/**
	 * 返回码
	 */
	public static final int UPLOAD_FILE_SUCCESS = 1000;
	public static final int UPLOAD_FILE_FAILED = 1001;

}
