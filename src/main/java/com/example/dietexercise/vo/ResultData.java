package com.example.dietexercise.vo;

import lombok.Data;
import lombok.Getter;

@Data
public class ResultData<DT> {
	@Getter
	private String resultCode;
	private String resultMsg;
	@Getter
	private DT data;
	
	public static <DT> ResultData<DT> from(String resultCode, String resultMsg) {
	
		return from(resultCode, resultMsg, null);
	}

	public static <DT> ResultData<DT> from(String resultCode, String resultMsg, DT data) {
		
		ResultData<DT> rd = new ResultData<>();
		rd.resultCode = resultCode;
		rd.resultMsg = resultMsg;
		rd.data = data;
		
		return rd;
	}
	
	public boolean isSuccess() {
		return this.resultCode.startsWith("S-");
	}
	public boolean isFail() {
		return isSuccess() == false;
	}

	
}
