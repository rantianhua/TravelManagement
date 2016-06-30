package cn.sdu.travel.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.apache.commons.codec.binary.Base64;

public class WebUtils {
	public static String generateID() {
		return UUID.randomUUID().toString();
	}

	public static String md5(String message) {
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte md5[] = md.digest(message.getBytes());

			Base64 encoder = new Base64();
			return encoder.encode(md5).toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}
}
