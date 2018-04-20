/**
 * 
 */
package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * @description：员工列表创建时间格式转换
 */
public class CreateTimeConvert implements Converter<String ,Date> {

	@Override
	public Date convert(String source) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
