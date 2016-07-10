package cn.sdu.travel.web.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.sdu.travel.bean.HumanResource;
import cn.sdu.travel.bean.Passport;
import cn.sdu.travel.service.ApplicantService;
import cn.sdu.travel.service.impl.ApplicantServiceImpl;
import cn.sdu.travel.utils.WebUtils;
import cn.sdu.travel.web.formbean.PassportInfoForm;

public class ModifyPassportInfoServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 上传设置
			DiskFileItemFactory factory = new DiskFileItemFactory(); // 10k
			factory.setSizeThreshold(1024 * 1024);
			factory.setRepository(new File(this.getServletContext()
					.getRealPath("/temp")));
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(1024 * 1024 * 5);

			upload.setHeaderEncoding("UTF-8");
			List<FileItem> list = upload.parseRequest(request);

			// 封装表单
			PassportInfoForm form = new PassportInfoForm();
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

			// 表单校验
			if (!form.validate()) {
				request.setAttribute("form", form);
				request.setAttribute("action", "8");
				request.getRequestDispatcher("/WEB-INF/pages/editpassport.jsp")
						.forward(request, response);
				return;
			}

			// 上传图片
			for (FileItem item : list) {
				if (!item.isFormField()) {
					String filename = item.getName().substring(
							item.getName().lastIndexOf("\\") + 1);
					InputStream in = item.getInputStream();
					int len = 0;
					byte buffer[] = new byte[1024];
					String saveFileName = WebUtils.generateFileName(filename);
					String savepath = WebUtils.generateSavePath(
							this.getServletContext().getRealPath(
									"/upload/picture"), saveFileName);
					String path = savepath + File.separator + saveFileName;
					FileOutputStream out = new FileOutputStream(path);
					while ((len = in.read(buffer)) > 0) {
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
					item.delete();

					String name = item.getFieldName();
					String value = path.substring(path.indexOf(File.separator
							+ "upload" + File.separator + "picture"));
					BeanUtils.setProperty(form, name, value);
				}

				// 保存数据
				Passport p = new Passport();
				WebUtils.copyBean(form, p);
				HumanResource hr = (HumanResource) request.getSession()
						.getAttribute("hr");
				p.setIdentity(hr.getId());
				ApplicantService service = new ApplicantServiceImpl();
				service.savePassportInfo(p);
				
				request.setAttribute("passport", p);
			}
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			request.setAttribute("message", "文件大小不能超过5M");
			request.setAttribute("action", "8");
			request.getRequestDispatcher("/WEB-INF/pages/editpassport.jsp")
					.forward(request, response);
			return;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		request.setAttribute("action", "3");
		request.getRequestDispatcher("/WEB-INF/pages/passport.jsp").forward(
				request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
