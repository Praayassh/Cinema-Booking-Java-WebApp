package np.com.prayashsapkota.screenx.homepage;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet{
	   private static final long serialVersionUID = 1L;

	    private Map<String, String> movies = new HashMap<>();

	    @Override
	    public void init() throws ServletException {
	        movies.put("Escape", "images/banners/5I0koi3lvHtGDhYvfAkLssQKEGO.webp");
	        movies.put("Rebellion", "images/banners/5js5JCtxfiYF2MdNn0zGyCwyg8L.webp");
	        movies.put("Dreams", "images/banners/6Gy1ReRZ9sK9g8TPXZGz7CcQvrV.webp");
	        movies.put("Shadow", "images/banners/7dFZJ2ZJJdcmkp05B9NWlqTJ5tq.webp");
	        movies.put("Finale", "images/banners/7QMsOTMUswlwxJP0rTTZfmz2tX2.webp");
	        movies.put("Legacy", "images/banners/7wbPHetLZnyL6hwqrfEPnLNKnXu.webp");
	        movies.put("Jurassic", "images/banners/8GeBQWQOTu7yLwNfCV6iWyL8xNf.webp");
	        movies.put("Titan", "images/banners/95RVeMWMvk97PBW0msryIJC32XD.webp");
	        movies.put("Pinnacle", "images/banners/9zLuN3MfvTcABYYNJq5PkIG81S5.webp");
	        movies.put("Reality", "images/banners/gKkl37BQuKTanygYQG1pyYgLVgf.webp");
	        movies.put("Whisper", "images/banners/gvz0m4MJ8sAj6yMcQdwN07bNjRY.webp");
	        movies.put("Nova", "images/banners/kUWvvMkNIf21UUDmHjYw55v6o7C.webp");
	        movies.put("Vista", "images/banners/mEg3ohdBkLOs0L1GmYGtiwyJXlE.webp");
	        movies.put("Echo", "images/banners/naCgSiacvV685kait6fBvhVhdce.webp");
	        movies.put("Turbine", "images/banners/pjnD08FlMAIXsfOLKQbvmO0f0MD.webp");
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    	
	    	 String query = req.getParameter("query");
	         Map<String, String> results = new HashMap<>();

	         for (Map.Entry<String, String> entry : movies.entrySet()) {
	             if (entry.getKey().toLowerCase().contains(query.toLowerCase())) {
	                 results.put(entry.getKey(), entry.getValue());
	             }
	         }
	         req.setAttribute("results", results);
	         req.getRequestDispatcher("/searchResults.jsp").forward(req, resp);
	     }
	 }