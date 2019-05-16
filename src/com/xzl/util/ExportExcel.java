package com.xzl.util;

import org.apache.poi.xssf.usermodel.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class ExportExcel {
    public  XSSFWorkbook export_excel(List<Map<String,Object>> list) throws Exception {

        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet();//获取该工作区间的第一个sheet
        int size = list.size();
        XSSFRow row = sheet.createRow(0);//标题行
        XSSFCell title1 = row.createCell(0);
        XSSFCell title2 = row.createCell(1);
        XSSFCell title3 = row.createCell(2);
        XSSFCell title4 = row.createCell(3);
        XSSFCell title5 = row.createCell(4);
        XSSFCell title6 = row.createCell(5);
        XSSFCell title7 = row.createCell(6);
        XSSFCell title8 = row.createCell(7);
        XSSFCell title9 = row.createCell(8);
        XSSFCell title10 = row.createCell(9);

        title1.setCellValue("用户名");
        title2.setCellValue("真实姓名");
        title3.setCellValue("性别");
        title4.setCellValue("申请职位");
        title5.setCellValue("毕业院校");
        title6.setCellValue("毕业专业");
        title7.setCellValue("现居住地");
        title8.setCellValue("联系方式");
        title9.setCellValue("申请日期");
        title10.setCellValue("安排日期");

        for (int i = 0; i < size; i++) {
            Map<String,Object> map = list.get(i);
            XSSFRow row1 = sheet.createRow(i + 1);
            XSSFCell cell1 = row1.createCell(0);
            XSSFCell cell2 = row1.createCell(1);
            XSSFCell cell3 = row1.createCell(2);
            XSSFCell cell4 = row1.createCell(3);
            XSSFCell cell5 = row1.createCell(4);
            XSSFCell cell6 = row1.createCell(5);
            XSSFCell cell7 = row1.createCell(6);
            XSSFCell cell8 = row1.createCell(7);
            XSSFCell cell9 = row1.createCell(8);
            XSSFCell cell10 = row1.createCell(9);

            cell1.setCellValue((String)map.get("username"));
            cell2.setCellValue((String)map.get("fullname"));
            cell3.setCellValue((String)map.get("sex"));
            cell4.setCellValue((String) map.get("p_name"));
            cell5.setCellValue((String)map.get("school"));
            cell6.setCellValue((String)map.get("major"));
            cell7.setCellValue((String)map.get("now_address"));
            cell8.setCellValue((String)map.get("tel"));
            XSSFCellStyle cellStyle = workbook.createCellStyle();

            XSSFDataFormat format= workbook.createDataFormat();

            cellStyle.setDataFormat(format.getFormat("yyyy-mm-dd"));

            cell9.setCellStyle(cellStyle);
            cell9.setCellValue((Date)map.get("apply_date"));
        }

        return workbook;
    }
}