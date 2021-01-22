package com.young.plan;

import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/kakao/signUp/")
	public String signUp() {
		final String kakaoRequestUrl = "https://kauth.kakao.com/oauth/authorize?client_id=%s&redirect_uri=%s&response_type=code";
		final String kakaoKey = "cf83f297804712adcff8375dfef83e89";
		final String redirectUrl = "http://localhost:7070/plan/signup/";
		
		return "redirect:" + String.format(kakaoRequestUrl, kakaoKey, redirectUrl);
	}
	
	@RequestMapping("/signup/")
	public String signUp(HttpServletRequest req) {
		String code = req.getParameter("code");
		
		System.out.println("code : " + code);
		
		MultiValueMap<String, Object> mmap = new LinkedMultiValueMap<String, Object>();
		
		mmap.add("grant_type", "authorization_code"); //필수 고정값
		mmap.add("client_id", "33cad78033abdb0dae72279b8bb1d043"); //카카오 rest_key
		mmap.add("redirect_url", getServerName(req, "/")); //응답받은 리턴URL
		mmap.add("code", code); //카카오 로그인 후


		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8"); //헤더지정
		HttpEntity<MultiValueMap<String, Object>> httpEntity = new HttpEntity<MultiValueMap<String,Object>>(mmap, headers);

		RestTemplate restTemplate = new RestTemplate();
		FormHttpMessageConverter converter = new FormHttpMessageConverter();
		converter.setSupportedMediaTypes(Collections.singletonList(MediaType.APPLICATION_FORM_URLENCODED));
		restTemplate.getMessageConverters().add(converter);

	      //code를 이용해 로그인 사용자 token값 가벼오기
		ResponseEntity<AccessTokenRequestResponse> tokenResponse = restTemplate.postForEntity("33cad78033abdb0dae72279b8bb1d043", httpEntity, AccessTokenRequestResponse.class);
	      headers.add("Authorization", "Bearer " + tokenResponse.getBody().getAccess_token());
	      mmap.clear();
	      httpEntity = new HttpEntity<MultiValueMap<String,Object>>(mmap, headers);

	      //해당 토큰값으로 사용자 정보 가져오기
	      ResponseEntity<UserProfileViewResponse> profileResponse = restTemplate.postForEntity("33cad78033abdb0dae72279b8bb1d043", httpEntity, UserProfileViewResponse.class);

	       logger.info("loginRecd::::"+profileResponse.getBody().getKakao_account().getAge_range());
	       logger.info("loginRecd::::"+profileResponse.getBody().getKakao_account().getBirthday());
	       logger.info("loginRecd::::"+profileResponse.getBody().getKakao_account().getEmail());
	       logger.info("loginRecd::::"+profileResponse.getBody().getProperties().getNickname());
	      
	      return "/";

	}
	
    public String getServerName(HttpServletRequest req, String returnUrl) {

        StringBuffer serverName = new StringBuffer("");
        serverName.append("http://");
        serverName.append(req.getServerName());
        serverName.append(returnUrl);
        return serverName.toString();
      }
	
}
