package cn.sdu.travel.utils;

import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class WebUtils {
	// 生成唯一ID
	public static String generateID() {
		return UUID.randomUUID().toString();
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
}
