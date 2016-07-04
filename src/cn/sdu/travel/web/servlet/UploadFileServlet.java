package cn.sdu.travel.web.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import cn.sdu.travel.bean.ReturnRestfulJson;
import cn.sdu.travel.utils.Constants;

public class UploadFileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Gson gson;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		gson = new Gson();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if(!isMultipart) {
			System.out.println("非文件上传");
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		File tempDir = new File(Constants.FILE_TEMP_DIR);
		File saveFileDir = new File(Constants.FILE_SAVE_DIR);
		File saveImgDir = new File(Constants.FILE_SAVE_IMG_DIR);
		if(!tempDir.exists()) tempDir.mkdirs();
		if(!saveFileDir.exists()) saveFileDir.mkdirs();
		if(!saveImgDir.exists()) saveImgDir.mkdirs();
		//System.out.println("临时文件目录" + tempDir.getAbsolutePath());
		//System.out.println("保存文件目录" + saveDir.getAbsolutePath());
		factory.setRepository(tempDir);
		ServletFileUpload upload = new ServletFileUpload(factory);
		PrintWriter out = resp.getWriter();
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort();
		try {
			List<FileItem> items = upload.parseRequest(req);
			Iterator<FileItem> iter = items.iterator();
			while(iter.hasNext()) {
				FileItem item = iter.next();
				if(!item.isFormField()) {
					boolean isPic = false;
					String itemName = item.getName();
					if(itemName.endsWith(".jpg") || itemName.endsWith(".jpeg") || itemName.endsWith(".png")
							|| itemName.endsWith(".bmp")) {
						isPic = true;
					}
					File uploadFile = null;
					if(isPic) {
						uploadFile = new File(saveImgDir,itemName);
					}else {
						uploadFile = new File(saveFileDir,itemName);
					}
					if(!uploadFile.exists()) uploadFile.createNewFile();
					try {
						item.write(uploadFile);
						String data = null;
						if(isPic) {
							data = basePath+Constants.MAP_SAVE_IMG+"/"+item.getName();
						}else {
							data = basePath+Constants.MAP_SAVE_FILE+"/"+item.getName();
						}
						resonpseData(out, Constants.UPLOAD_FILE_SUCCESS, "上传文件成功。", data);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						resonpseData(out, Constants.UPLOAD_FILE_FAILED, e.getMessage(), null);
					}
				}
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			resonpseData(out, Constants.UPLOAD_FILE_FAILED, e.getMessage(), null);
		}finally {
			if(out != null) {
				out.flush();
				out.close();
			}
		}
	}
	
	/**
	 * 返回数据
	 * @param returnCode 响应代码
	 * @param returnInfo 响应信息
	 * @param returnData 返回的数据
	 */
	private void resonpseData(PrintWriter out,int returnCode,String returnInfo,String returnData) {
		ReturnRestfulJson returnJson = new ReturnRestfulJson();
		returnJson.returnCode = returnCode;
		returnJson.returnInfo = returnInfo;
		returnJson.data = returnData;
		String result = gson.toJson(returnJson);
		out.println(result);
	}
}
