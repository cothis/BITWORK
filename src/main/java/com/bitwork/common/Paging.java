package com.bitwork.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Paging {
    //Config
    private int rowPerPage = 10;
    private int pagePerBlock = 5;

    //전체 Data
    private final int totalRow;
    private int totalPage;
    
    //현재 Data
    private int nowPage;
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

    public Paging(int totalRow, int nowPage, int rowPerPage, int pagePerBlock) {
        this.rowPerPage = rowPerPage;
        this.pagePerBlock = pagePerBlock;
        this.totalRow = totalRow;
        this.nowPage = nowPage;
        calculation();
    }

    private void calculation() {
        totalPage = (totalRow - 1) / rowPerPage + 1;
        nowPage = Math.min(nowPage, totalPage);
        nowBlock = (nowPage - 1) / pagePerBlock + 1;

        startRow = (nowPage - 1) * rowPerPage + 1;
        endRow = Math.min(nowPage * rowPerPage, totalRow);

        startPage = (nowBlock - 1) * pagePerBlock + 1;
        endPage = Math.min(nowBlock * pagePerBlock, totalPage);
    }
}
