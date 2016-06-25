package com.ailk.sets.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.springframework.util.StringUtils;

import com.ailk.sets.model.CandidateMail;
import com.ailk.sets.model.CandidateResult;

public class XLSUtil {

	private Workbook book;
	private String filePath;

	public XLSUtil(String filePath) {

		this.filePath = filePath;
		try {
			InputStream input = new FileInputStream(filePath);
			this.book = Workbook.getWorkbook(input);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Sheet getSheet(int number) {
		return book.getSheet(number);
	}

	public int getRows(Sheet sheet) {
		return sheet.getRows();
	}

	public int getCells(Sheet sheet) {
		return sheet.getColumns();
	}

	public String getDate(Sheet sheet, int cell, int row) {
		return sheet.getCell(cell, cell).getContents();
	}

	public CandidateResult resultexcel() {

		// XLSUtil xls = new XLSUtil(filePath);
		Sheet sheet = getSheet(0);
		int rows = getRows(sheet);
		// int cells = getCells(sheet);

		ArrayList<CandidateMail> list = new ArrayList<CandidateMail>();
		ArrayList<String> errors = new ArrayList<String>();

		ArrayList<String> emails = new ArrayList<String>();
		Pattern pattern = Pattern
				.compile("^[\\w\\-][\\w\\-\\.]*@[a-zA-Z0-9]+([a-zA-Z0-9\\-\\.]*[a-zA-Z0-9\\-]+)*\\.[a-zA-Z0-9]{2,}$");

		for (int i = 2; i < rows; i++) {
			CandidateMail user = new CandidateMail();
			String name = sheet.getCell(0, i).getContents();
			String email = sheet.getCell(1, i).getContents();

			String errorStr = "";
			int emailIndex = emails.indexOf(email);
			if (emailIndex >= 0) // 如果有
				errorStr = "第" + (emailIndex + 3) + "行["
						+ emails.get(emailIndex) + "]" + "和第" + (i + 1)
						+ "行邮箱重复\n";

			if (StringUtils.isEmpty(name) && !StringUtils.isEmpty(email))
				errorStr = "第" + (i + 1) + "行[" + name + "]没有写姓名\n";

			if (StringUtils.isEmpty(email) && !StringUtils.isEmpty(name))
				errorStr = "第" + (i + 1) + "行[" + name + "]没有写邮箱\n";

			Matcher matcher = pattern.matcher(email);
			boolean b = matcher.matches();
			if (!b)
				errorStr = "第" + (i + 1) + "行[" + email + "]邮箱格式不正确\n";

			emails.add(email);
			if (StringUtils.isEmpty(email) && StringUtils.isEmpty(name)) {
				continue;
			}

			if (!StringUtils.isEmpty(errorStr)) {
				errors.add(errorStr);
				continue;
			}

			user.setEmail(email);
			user.setName(name);
			list.add(user);
		}

		CandidateResult result = new CandidateResult(list, errors, rows - 2);
		return result;
	}
}
