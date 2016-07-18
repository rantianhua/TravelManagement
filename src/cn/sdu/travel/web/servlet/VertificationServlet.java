package cn.sdu.travel.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.sdu.travel.bean.Vertification;
import cn.sdu.travel.service.VertificationService;
import cn.sdu.travel.service.impl.VertificationServiceImpl;
import cn.sdu.travel.utils.Constants;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.VertificationForm;


@WebServlet("/VertificationServlet")
public class VertificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public VertificationServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		VertificationService  vs=new VertificationServiceImpl();
		
		try {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 1024);
			factory.setRepository(new File(this.getServletContext()
					.getRealPath("/temp")));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(1024 * 1024 * 10);
			List<FileItem> list = upload.parseRequest(request);
			// 封装表单
			VertificationForm form = new VertificationForm();
			for (FileItem item : list) {
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString("UTF-8");
					BeanUtils.setProperty(form, name, value);
				} else {
					String name = item.getFieldName();
					String value = item.getName();
					BeanUtils.setProperty(form, name, value);
				}
			}
			if(!form.validate()){
				request.setAttribute("form", form);
				request.setAttribute("action", "6");
				request.getRequestDispatcher("/WEB-INF/pages/backwriteoff.jsp").forward(request, response);
				return;
			}
			
			for (FileItem item : list) {
				if (!item.isFormField()) {
					if (item.getName() != null
							&& !item.getName().trim().equals("")) {
						String filename = item.getName().substring(
								item.getName().lastIndexOf("\\") + 1);
						InputStream in = item.getInputStream();
						int len = 0;
						byte buffer[] = new byte[1024];
						String saveFileName = WebUtils
								.generateFileName(filename);
						String savepath = WebUtils.generateSavePath(
								this.getServletContext().getRealPath(
										"/upload/file"), saveFileName);
						String path = savepath + File.separator
								+ saveFileName;
						FileOutputStream out = new FileOutputStream(path);
						while ((len = in.read(buffer)) > 0) {
							out.write(buffer, 0, len);
						}
						in.close();
						out.close();
						item.delete();

						String name = item.getFieldName();
						String value = path.substring(path
								.indexOf(File.separator + "upload"
										+ File.separator + "file"));
						BeanUtils.setProperty(form, name, value);
					}
				}
			}
			Vertification v=new Vertification();
			WebUtils.copyBean(form,v);
			Map<String, Object> result=vs.saveVertificationInfo(v);
			form.setErrors(result);
			System.out.println(form.getErrors());
			request.setAttribute("form", form);
			request.setAttribute("action","6");
				request.getRequestDispatcher("/WEB-INF/pages/backwriteoff.jsp").forward(request,
						response);
				return;
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			request.setAttribute("returnInfo", "文件大小不能超过10M");
			request.setAttribute("action", "6");
			request.getRequestDispatcher("/WEB-INF/pages/applyabroad.jsp")
					.forward(request, response);
			return;
		} catch (IllegalAccessException e) {
			request.setAttribute("returnInfo", "未知错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			e.printStackTrace();
		} catch (InvocationTargetException e) {	
			request.setAttribute("returnInfo", "未知错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			e.printStackTrace();
		} catch (FileUploadException e) {
			request.setAttribute("returnInfo", "上传错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			e.printStackTrace();
		} catch (ParseException e) {
			request.setAttribute("returnInfo", "日期校验错误！");
			request.getRequestDispatcher("/web/exception.jsp").forward(request,
					response);
			e.printStackTrace();
		}
		
	}

}
