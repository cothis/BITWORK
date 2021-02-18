package com.bitwork.board.dto;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.Setter;
import lombok.ToString;
import lombok.Getter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardUpdateForm {
	
	private Integer status;
	private String subject;
	private String content;
	private String fileName;
	private String oriName;
	private String boardIdx;
	
}
