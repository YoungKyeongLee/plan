package com.young.plan;

public class UserProfileViewResponse {

	private String id;
    private UserProfileViewPropertiesResponse properties;
    private UserProfileViewKakaoAccountResponse kakao_account;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public UserProfileViewPropertiesResponse getProperties() {
		return properties;
	}
	public void setProperties(UserProfileViewPropertiesResponse properties) {
		this.properties = properties;
	}
	public UserProfileViewKakaoAccountResponse getKakao_account() {
		return kakao_account;
	}
	public void setKakao_account(UserProfileViewKakaoAccountResponse kakao_account) {
		this.kakao_account = kakao_account;
	}
    
}
