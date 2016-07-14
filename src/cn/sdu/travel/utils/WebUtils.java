package cn.sdu.travel.utils;

import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

public class WebUtils {
	// 生成唯一ID
	public static String generateID() {
		return UUID.randomUUID().toString();
	}

	// 生成上传文件的文件名
	public static String generateFileName(String filename) {
		return UUID.randomUUID().toString() + "_" + filename;
	}

	// 生成上传文件的存储目录
	public static String generateSavePath(String path, String filename) {
		int hashcode = filename.hashCode();
		int dir1 = hashcode & 15;
		int dir2 = (hashcode >> 4) & 0xf;

		String savepath = path + File.separator + dir1 + File.separator + dir2;
		File file = new File(savepath);
		if (!file.exists()) {
			file.mkdirs();
		}
		return savepath;
	}

	// 将request中的参数复制到bean
	public static <T> T request2Bean(HttpServletRequest request,
			Class<T> beanClass) {

		try {
			T bean = beanClass.newInstance();
			Enumeration e = request.getParameterNames();
			while (e.hasMoreElements()) {
				String name = (String) e.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);
			}
			request.setCharacterEncoding("UTF-8");
			String s_checkcode = (String) request.getSession().getAttribute(
					"checkcode");
			BeanUtils.setProperty(bean, "s_checkcode", s_checkcode);
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// 复制一个bean到另一个bean
	public static void copyBean(Object src, Object dest) {
		try {
			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			BeanUtils.copyProperties(dest, src);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// 计算两个Date的日期差
	public static int daysBetween(Date now, Date returnDate) {
		Calendar cNow = Calendar.getInstance();
		Calendar cReturnDate = Calendar.getInstance();
		cNow.setTime(now);
		cReturnDate.setTime(returnDate);
		setTimeToMidnight(cNow);
		setTimeToMidnight(cReturnDate);
		long todayMs = cNow.getTimeInMillis();
		long returnMs = cReturnDate.getTimeInMillis();
		long intervalMs = todayMs - returnMs;
		return (int) (intervalMs / (1000 * 86400));
	}

	private static void setTimeToMidnight(Calendar calendar) {
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
	}
}
