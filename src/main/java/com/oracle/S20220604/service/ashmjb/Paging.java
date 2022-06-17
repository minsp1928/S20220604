package com.oracle.S20220604.service.ashmjb;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Paging {
	private int currentPage = 1;
	private int rowPage = 10;
	private int pageBlock = 10;
	private int start;
	private int end;
	private int startPage;
	private int endPage;
	private int total;
	private int totalPage;
	
	public Paging(int total, String currentPage1) {
		this.total = total;
		if(currentPage1 != null) { // 페이지가 널이 아니면 위에 큐런트 페이지에 값을 넣어라 널이면 1이 그대로 들어가고
			this.currentPage = Integer.parseInt(currentPage1); 
		}
		start = (currentPage - 1) * rowPage + 1 ; // 시작시에는무조건 1이됨 
		end	  = start + rowPage -1;				  // 시작시에는 무조건 10이 만들어짐
		totalPage = (int)Math.ceil((double)total/rowPage);	// 시작시에 무조건 2
		
		startPage = currentPage - (currentPage - 1) % pageBlock ;  // 시작시에 1
		endPage   = startPage + pageBlock - 1;
		
		if(endPage > totalPage) { // 공갈 페이지 없애려고 여기서 작업해줌 
			endPage = totalPage;
		}
	}
}
	
	