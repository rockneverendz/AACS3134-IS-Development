package control.staff.ingredient;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import entity.Ingredient;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.IngredientService;

public class retriveIngre extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        IngredientService is = new IngredientService();
        Gson gson = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()
                .create();
        List<Ingredient> list = is.findAllWithoutList();
        String json = gson.toJson(list);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
