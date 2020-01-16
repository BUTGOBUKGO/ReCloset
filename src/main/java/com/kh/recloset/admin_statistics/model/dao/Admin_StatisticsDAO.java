package com.kh.recloset.admin_statistics.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.recloset.admin_statistics.model.vo.AdminSelectTOP3;
import com.kh.recloset.admin_statistics.model.vo.SelectAgeRatio;
import com.kh.recloset.seller_statistics.model.vo.GenderRatio;
import com.kh.recloset.seller_statistics.model.vo.MonthRevenue;
import com.kh.recloset.seller_statistics.model.vo.SelectRevenue;

@Repository
public class Admin_StatisticsDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public String[][] adminSelectMonthRevenue(){
		List<MonthRevenue> list = new ArrayList<>();
		list = sqlSession.selectList("admin_statistics-mapper.adminSelectMonthRevenue");
		
		String[][] arr = new String[12][2];

		for(int i = 0; i < list.size(); i++) {
			arr[i][0] = list.get(i).getMon();
			arr[i][1] = String.valueOf(list.get(i).getTotalCost());
		}
		
		return arr;
	}
	public String[][] adminGenderRatio(){
		List<GenderRatio> list = new ArrayList<>();
		list = sqlSession.selectList("admin_statistics-mapper.adminSelectGenderRatio");
		
		String[][] arr = new String[2][2];
		
		for(int i = 0; i < list.size(); i++) {
			arr[i][0] = list.get(i).getGender();
			arr[i][1] = String.valueOf(list.get(i).getPct());
		}
		
		return arr;
	}
	public SelectRevenue adminSelectRevenue() {
		
		return sqlSession.selectOne("admin_statistics-mapper.adminSelectAllRevenue");

	}
	public String[][] adminSelectAgeRatio() {
		List<SelectAgeRatio> list = new ArrayList<>();
		list = sqlSession.selectList("admin_statistics-mapper.adminSelectAgeRatio");
		
		String[][] arr = new String[10][2];
		
		for(int i = 0; i< list.size(); i++) {
			arr[i][0] = list.get(i).getAgeRange() + "대";
			arr[i][1] = String.valueOf(list.get(i).getPct());
		}
		
		return arr;
		
	}
	
	/*
	 * public String[][] adminSelectTOP3_() { List<AdminSelectTOP3> list = new
	 * ArrayList<>(); list =
	 * sqlSession.selectList("admin_statistics-mapper.adminSelectTOP3");
	 * 
	 * String[][]arr = new String[list.size()][4];
	 * 
	 * for(int i = 0; i < list.size(); i++) { arr[i][0] = list.get(i).getMon();
	 * arr[i][1] = String.valueOf(list.get(i).getRank()); arr[i][2] =
	 * String.valueOf(list.get(i).getTotal()); arr[i][3] =
	 * list.get(i).getUserName(); }
	 * 
	 * return arr; }
	 */
	
	public String[][][] adminSelectTOP3() {
		List<AdminSelectTOP3> list = new ArrayList<>();
		list = sqlSession.selectList("admin_statistics-mapper.adminSelectTOP3");
		
		String[][][]arr = new String[12][10][4];

		for(int i = 0, mon = 0;  i < list.size() - 1; i++) {
			arr[mon][list.get(i).getRank() - 1][0] = list.get(i).getMon();
			arr[mon][list.get(i).getRank() - 1][1] = String.valueOf(list.get(i).getRank());
			arr[mon][list.get(i).getRank() - 1][2] = String.valueOf(list.get(i).getTotal());
			arr[mon][list.get(i).getRank() - 1][3] = list.get(i).getUserName();
			
			if(list.get(i).getRank() >= list.get(i+1).getRank()) {
				mon++;
			} else if(i == list.size() - 2) {
				int j = i+1;
				arr[mon][list.get(j).getRank() - 1][0] = list.get(j).getMon();
				arr[mon][list.get(j).getRank() - 1][1] = String.valueOf(list.get(j).getRank());
				arr[mon][list.get(j).getRank() - 1][2] = String.valueOf(list.get(j).getTotal());
				arr[mon][list.get(j).getRank() - 1][3] = list.get(j).getUserName();
				
				break;
			}
		}

		/*
		for(int i = 0; i < 12; i++) {
			for(int j = 0; j < 10; j++) {
				String mon1 = list.get(i+j).getMon();
				String mon2 = list.get(i).getMon();
				if(mon1.equals(mon2)) {
				arr[i][j][0] = list.get(i+j).getMon();
				arr[i][j][1] = String.valueOf(list.get(i+j).getRank());
				arr[i][j][2] = String.valueOf(list.get(i+j).getTotal());
				arr[i][j][3] = list.get(i+j).getUserName(); } else {
					break;
				}
			}
		}
		*/
		System.out.println(arr);
		
		return arr;
	}
}
