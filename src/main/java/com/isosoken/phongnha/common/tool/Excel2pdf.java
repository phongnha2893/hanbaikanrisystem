package com.isosoken.phongnha.common.tool;

import com.itextpdf.text.Document;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.spire.xls.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;

import java.awt.*;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

@Component
public class Excel2pdf {
    public void convert(Workbook workbook, int numColumn, OutputStream fileOutput) throws Exception {

        Sheet my_worksheet = workbook.getSheetAt(0);
        Iterator<Row> rowIterator = my_worksheet.iterator();
        Document iText_xls_2_pdf = new Document();
        PdfWriter.getInstance(iText_xls_2_pdf, fileOutput);
        iText_xls_2_pdf.open();
        PdfPTable my_table = new PdfPTable(numColumn);
        PdfPCell table_cell;
        while (rowIterator.hasNext()) {
            Row row = rowIterator.next();
            Iterator<Cell> cellIterator = row.cellIterator();
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next(); //Fetch CELL
                switch (cell.getCellType()) { //Identify CELL type
                    case STRING:
                        table_cell = new PdfPCell(new Phrase(cell.getStringCellValue()));
                        my_table.addCell(table_cell);
                        break;
                    case NUMERIC:
                        table_cell = new PdfPCell(new Phrase(String.valueOf(cell.getNumericCellValue())));
                        my_table.addCell(table_cell);
                        break;

                }
            }

        }
        iText_xls_2_pdf.add(my_table);
        iText_xls_2_pdf.close();
    }

    public void convert(Workbook workbook, OutputStream fileOutput, PaperSizeType paperSizeType, double... columnsWidth) throws Exception {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        workbook.write(bos);
        byte[] barray = bos.toByteArray();
        InputStream is = new ByteArrayInputStream(barray);

        com.spire.xls.Workbook wb = new com.spire.xls.Workbook();
        wb.loadFromStream(is);
        Worksheet worksheet = wb.getWorksheets().get(0);

        // color
        CellRange dataRange = worksheet.getAllocatedRange();
        ConditionalFormatWrapper format1 = dataRange.getConditionalFormats().addCondition();
        format1.setFirstFormula("=MOD(ROW(),2)=0");
        format1.setFormatType(ConditionalFormatType.Formula);
        format1.setBackColor(new Color(201, 255, 223));

        ConditionalFormatWrapper format2 = dataRange.getConditionalFormats().addCondition();
        format2.setFirstFormula("=MOD(ROW(),2)=1");
        format2.setFormatType(ConditionalFormatType.Formula);
        format2.setBackColor(new Color(250, 252, 230));


        // column width
        if (columnsWidth != null && columnsWidth.length > 0) {
            CellRange[] columns = worksheet.getColumns();
            for (int i = 0; i < columns.length; i++) {
                columns[i].setColumnWidth(columnsWidth[i]);
            }
        }

        PageSetup pageSetup = worksheet.getPageSetup();
        pageSetup.setPaperSize(paperSizeType);
        pageSetup.setCenterHorizontally(true);
        worksheet.saveToPdfStream(fileOutput);
        is.close();
    }
}