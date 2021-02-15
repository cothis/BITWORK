package com.bitwork.board.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CommentsVO {
	private Integer cmtIdx;
	private String name;
	private String position;
	private String cmtContent;
	private String cmtDate;
	private Integer boardIdx;
	
	
}

	


