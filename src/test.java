import java.sql.SQLException;

import com.bookstore.search.model.bookDAO;
import com.bookstore.search.model.bookVO;

public class test {

	public static void main(String[] args) {
		bookDAO dao = new bookDAO();
		bookVO vo = new bookVO();
		vo.setBooktitle("테스트");
		vo.setISBN("9999999");
		vo.setOrderno(8);
		vo.setPrice(35000);
		vo.setPublisher("출판사테스트");
		vo.setWriter("작가테스트");
		try {
			int cnt = dao.insertbook(vo);
			System.out.println("실행결과 : cnt "+cnt+"매개변수 vo "+vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
