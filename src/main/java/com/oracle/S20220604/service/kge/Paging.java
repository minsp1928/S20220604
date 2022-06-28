package com.oracle.S20220604.service.kge;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Paging {
	private int currentPage=1;
	private int rowPage=8;
	private int pageBlock=10;
	private int start;
	private int end;
	private int startPage;
	private int endPage;
	private int total;
	private int totalPage;
	//                 19
	public Paging(int total, String currentPage1) { //생성자
		this.total = total; // 19
		if (currentPage1 != null) {
			System.out.println("success");
			this.currentPage = Integer.parseInt(currentPage1); // 2
			System.out.println("됬나?");
		}
		System.out.println("currentPage1 -> "+currentPage1);
		System.out.println("Paging Start"+this.currentPage);
		start = (currentPage - 1) * rowPage + 1; // 시작시 1    11
		end = start + rowPage - 1;               // 시작시 10   20
		totalPage = (int)Math.ceil((double)total/rowPage); // 시작시 2 5 14
		          // 2               2
		startPage = currentPage - (currentPage - 1) % pageBlock; // 시작시 1
		endPage = startPage+pageBlock - 1; //10
		// 10          14
		if (endPage > totalPage) { // 가짜 Page 방지
			endPage = totalPage;
		}
	}
}
