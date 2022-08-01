package com.mpark.common.config;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.mpark.common.interceptorAdapter.LoggerInterceptor;
import com.mpark.common.util.StringUtil;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;



@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

	@Bean
	MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();
	}
	@Value("${serverPath}") private String serverPath;

	@Autowired
	LoggerInterceptor loggerInterceptor;

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean
	public FilterRegistrationBean getFilterRegistrationBean(){
		FilterRegistrationBean registrationBean = new FilterRegistrationBean(); 
		registrationBean.setFilter(new XssEscapeServletFilter());
		registrationBean.setOrder(1);
		registrationBean.addUrlPatterns("/*");
		return registrationBean;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loggerInterceptor)
				.addPathPatterns(addPathUrlList())
				.excludePathPatterns(excludeUrlList());

	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("css/").setCachePeriod(31536000);
		registry.addResourceHandler("/fonts/**").addResourceLocations("fonts/").setCachePeriod(31536000);
		registry.addResourceHandler("/img/**").addResourceLocations("img/").setCachePeriod(31536000);
		registry.addResourceHandler("/js/**").addResourceLocations("js/").setCachePeriod(31536000);
		registry.addResourceHandler("/file/**").addResourceLocations("file/").setCachePeriod(31536000);
		registry.addResourceHandler("/fullcalendar/**").addResourceLocations("fullcalendar/").setCachePeriod(31536000);
		registry.addResourceHandler("/modal/**").addResourceLocations("modal/").setCachePeriod(31536000);

		if(StringUtil.isWindows()) {
			registry.addResourceHandler("/myImg/**").addResourceLocations("file:C:/FILE/");
			registry.addResourceHandler("/admin/myImg/**").addResourceLocations("file:C:/FILE/");
		} else {
			registry.addResourceHandler("/myImg/**").addResourceLocations("file:"+serverPath);
			registry.addResourceHandler("/admin/myImg/**").addResourceLocations("file:"+serverPath);
		}

		/**
		 * Linux
		 * registry.addResourceHandler("/upload/**").addResourceLocations("file:/home/image/upload/");
		 */
	}

	public ArrayList<String> addPathUrlList(){
		ArrayList<String> urlList = new ArrayList<String>();
		return urlList;
	}

	public ArrayList<String> excludeUrlList(){
		ArrayList<String> urlList = new ArrayList<String>();
		urlList.add("/css/**");
		urlList.add("/fonts/**");
		urlList.add("/img/**");
		urlList.add("/js/**");
		urlList.add("/file/**");
		urlList.add("/myImg/**");
		urlList.add("/modal/**");

		urlList.add("/admin/login");
		urlList.add("/admin/loginProcess");
		
		

		return urlList;
		
	}
}


