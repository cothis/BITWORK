package com.bitwork.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {
    //Config
    private static final int ROW_PER_PAGE = 10;
    private static final int PAGE_PER_BLOCK = 5;

    //전체 Data
    private final int totalRow;
    private int totalPage;
    
    //현재 Data
    private final int nowPage;
    private int nowBlock;
    
    //현재 페이지에서 보일 시작, 끝 행번호
    private int startRow;
    private int endRow;

    //현재 블록에서 보일 시작, 끝 페이지번호
    private int startPage;
    private int endPage;

    public Paging(int totalRow, int nowPage) {
        this.totalRow = totalRow;
        this.nowPage = nowPage;
        calculation();
    }

    private void calculation() {
        totalPage = totalRow / ROW_PER_PAGE + 1;
        startRow = (nowPage - 1) * ROW_PER_PAGE + 1;
        endRow = Math.min(nowPage * ROW_PER_PAGE, totalRow);

        nowBlock = (nowPage - 1) / PAGE_PER_BLOCK + 1;
        startPage = (nowBlock - 1) * PAGE_PER_BLOCK + 1;
        endPage = Math.min(nowBlock * PAGE_PER_BLOCK, totalPage);
    }
}
