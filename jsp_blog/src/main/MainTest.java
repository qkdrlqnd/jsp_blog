package main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MainTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MainDAO dao = new MainDAO();		
		list(dao);
//		read(dao);
	}

	private static void read(MainDAO dao) {
		// TODO Auto-generated method stub

		
		MainDTO dto = new MainDTO();
		dto = dao.read(1);
		System.out.println("fname :" + dto.getFname());
		
	}

	private static void list(MainDAO dao) {
		// TODO Auto-generated method stub
		
		int nowPage = 1;
		int recordPerPage = 5;
		
		int sno = ((nowPage -1) * recordPerPage) +1 ;
		int eno = nowPage * recordPerPage;
		

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<MainDTO> list =  dao.list(map);
		Iterator<MainDTO> iter = list.iterator();

		
		
		while(iter.hasNext()){
			MainDTO dto = iter.next();
			
			System.out.println("fname :" + dto.getFname());
			
		}
		
	}

}
