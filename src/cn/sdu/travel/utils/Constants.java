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

	/**
	 * 返回码
	 */
	public static final int UPLOAD_FILE_SUCCESS = 1000;
	public static final int UPLOAD_FILE_FAILED = 1001;
	public static final int LOGIN_SUCCESS = 1100;
	public static final int WRONG_PASSWORD = 1101;
	public static final int NON_EXISTENT_ID = 1102;
	public static final int REGISTER_SUCCESS = 1200;
	public static final int USED_ID = 1201;
	public static final int UNUSED_ID = 1202;
	public static final int MODIFY_USER_INFO_SUCCESS = 1300;
	public static final int MODIFY_PASSPORT_INFO_SUCCESS = 1300;
	public static final int DB_ERROR = 1999;

}
